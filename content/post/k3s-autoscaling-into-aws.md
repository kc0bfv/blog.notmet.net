---
title: "K3S Autoscaling Into AWS"
date: 2023-03-05T16:08:35-06:00
draft: false
categories:
- Blog
tags:
- Kubernetes
- Programming
- Cloud
---

In which I document how I got k3s to autoscale into AWS - which is not documented anywhere.

<!--more-->

# Intro

"Learning Kubernetes" (aka k8s) has been on my road-map for a while, and recently I took the time to actually start.  K8S is used more and more where I work, I've really become interested in containers as a deployment method, and setting up a distributed computing "cluster" has always been interesting to me.

When learning something like this I really like to have a project to pursue.  I've got a few services running via docker-compose, and while it works fine the reverse proxy is a hack.  It's setup such that when one of the proxied services starts up slowly or crashes Nginx can fail to startup.  Then all the services are down, and they don't come back automatically.  Replacing this setup became my project.

I got my cluster working on my local machine with [k3d](https://k3d.io), then deployed it to a server using [k3s](https://k3s.io) when it became apparent I wouldn't be able to add further external nodes with k3d.  K3d allows you to add "nodes" on your local machine, thus simulating a larger deployment, but it does not support deploying nodes across multiple machines.

Additionally, I wanted to try out [Coder](https://coder.com).  Once I got my cluster running, and added Coder in, I wanted to be able to spawn virtual desktop computers and virtual machines with [Kubevirt](https://kubevirt.io).  The server I was using had too few resources though...  No matter - with k8s I could just create some additional nodes on other hardware.

I wanted to automatically spawn EC2 nodes on AWS and have them join my k8s cluster.  Then the cluster would schedule pods on those larger nodes as necessary.  All of that would happen automatically, when Coder created the pods.

To do this I needed the [cluster-autoscaler](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler) feature.  It looked like the autoscaler and was compatible with k3s, and that I would be able to autoscale into AWS instances easily.

That was wrong.

# Installing - Try One

Just follow the instructions on the [AWS cluster-autoscaler README](https://github.com/kubernetes/autoscaler/blob/master/cluster-autoscaler/cloudprovider/aws/README.md).  They provide the IAM policy you need, describe how to get credentials into your environment (and on top of their setup I use [kubeseal](https://github.com/bitnami-labs/sealed-secrets) to keep my secrets encrypted), and have an example kubectl YAML file.  I am using [Flux](https://fluxcd.io) to manage my k8s infrastructure, so I placed the YAML file in my infrastructure configs and dropped the sealed secrets in place and deployed.  I setup my autoscaling group in AWS, and it used a custom AMI I created that auto-joined my cluster.

# Problem

Unfortunately the cluster-autoscaler assumes you are using the AWS [cloud controller manager](https://kubernetes.io/docs/concepts/architecture/cloud-controller/) (CCM).  This is clear when the autoscaler starts but fails to do any autoscaling...  Reading the logs for the autoscaler's pod you will see warnings like:

```
Failed to get node infos for groups: wrong id: expected format aws:///<zone>/<name>, got k3s://ip-10-10-20-132
```

The autoscaler is expecting some kind of ID of the format "aws:///" instead of "k3s://".  Searching Google I eventually understood the autoscaler was looking at the "ProviderID" field visible when running `kubectl describe nodes`.  That ProviderID gets set by the CCM.

I was using the default k3s CCM.  The CCM interacts with a cloud API to do things like label and query node resources, route traffic, and use cloud-native services like load balancers.  I didn't need any of that.  And in fact - my design goal was to run on a cheap virtual private server, expanding into AWS only when necessary.  I did not want to use the AWS CCM.

Documentation I was reading suggested no clear fix, but some [1](https://www.reddit.com/r/kubernetes/comments/ydua9l/k3s_with_cluster_autoscaler_on_aws_not_working/) [2](https://github.com/kubernetes/cloud-provider-aws/issues/72) suggested a way to at least change the ProviderID.

It occurred to me that I could just try changing the ProviderID on a staging cluster, and see if anything broke.

# Solution

Nothing broke.  It was a little tricky to change the ProviderID for the control plane though...

First of all - here's my command to setup my control plane node:

```
export EXT_IP_ADDRESS=Put external IP address here
export WG_IP_ADDRESS=Put wireguard IP address here
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--tls-san=${EXT_IP_ADDRESS} --tls-san=${WG_IP_ADDRESS} --advertise-address=${WG_IP_ADDRESS} --node-ip=${WG_IP_ADDRESS} --kubelet-arg=provider-id=aws:///us-east-2a/i-doesnotexist" sh -
```

Here's how I setup worker nodes:

```
export WIREGUARD_HOST=put the control plane's wireguard IP here
export NODE_IP=put the node's wireguard IP here
export TOKEN=put the control plane token here

export KUBELET_ARG="--kubelet-arg=provider-id=aws:///$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)/$(curl -s http://169.254.169.254/latest/meta-data/instance-id)"
export K3S_URL="https://${WIREGUARD_HOST}:6443"
export K3S_TOKEN="${TOKEN}"
export EXTERNAL_IP="$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)"
export INSTALL_K3S_EXEC="${KUBELET_ARG} --node-ip=${NODE_IP} --node-external-ip=${EXTERNAL_IP} --flannel-iface=wg0"

curl -sfL https://get.k3s.io | sh -
```

Ok - this is a little more complicated than you may need.  I've setup a Wireguard network between my nodes so I can minimize the amount of attack surface I expose.  It's working well so I suppose I recommend it...  But then - just put your host and client Wireguard and regular external IP addresses in the appropriate slots, and grab your control plane token from its `/var/lib/rancher/k3s/server/node-token` file.

The `KUBELET_ARG` bits are what change the ProviderID entries, and cluster autoscaler will even allow that "i-doesnotexist" one, and the "us-east-2a" lie on the control plane.

If you've already installed a node, these kubelet args will not work right away...  The ProviderID is set when the node is created.  Rebooting will not fix it.

Delete your node and restart k3s on that node and the node will be recreated.

```
kubectl delete node NODENAME
systemctl restart k3s
```

Your mileage may vary - but this worked fine for me and didn't even wipe out persistent volumes or anything.

# Conclusion

After this the autoscaler was able to start nodes in my autoscaling group.  A few configuration fixes and they were connecting automatically over Wireguard, then k3s, and pods were scheduled on them.  I have not seen any ill-effect due to changing the ProviderID while still using the default k3s CCM.
