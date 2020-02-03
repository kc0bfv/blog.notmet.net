OUTNAME := $(shell date +blog_notmet_net_%Y%m%d-%H%M%S)

public_dir:
	hugo

${OUTNAME}.tar.bz2:
	hugo
	mv public ${OUTNAME}
	tar cfj ${OUTNAME}.tar.bz2 ${OUTNAME}
	rm -rf ${OUTNAME}

.PHONY: public_dir
