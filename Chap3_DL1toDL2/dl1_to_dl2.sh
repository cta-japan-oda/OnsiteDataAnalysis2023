#!/bin/sh

DL1FILE=hoge
OUTPUTDIR=hogedir
MODELDIR=modeldir
CONFIG=hogeconfig


lstchain_dl1_to_dl2 \
-f ${DL1FILE} \
-o ${OUTPUTDIR} \
-p ${MODELDIR} \
-c ${CONFIG}
