#!/bin/sh
# Basic Install Shell Script for Linux

TAR="tar xvf"
GZIP="gzip -d"
RM="rm -rf"
CHMOD="chmod"
MKDIR="mkdir"
CD="cd"
CP="cp"
MV="mv"
ECHO="echo"
CAT="cat"

echo Input install path:
read INSTALL_PATH

if [ "${INSTALL_PATH}" == "" ]; then
	INSTALL_PATH=`pwd`
fi

if [ ! -d "${INSTALL_PATH}" ]; then
	${ECHO} "${INSTALL_PATH} not exist."
	exit
fi

if [ ! -w "${INSTALL_PATH}" ]; then
	${ECHO} "${INSTALL_PATH} can not write."
	exit
fi

${MKDIR} ${INSTALL_PATH}/

${CP} ./basic.pkg ${INSTALL_PATH}/basic.tar

${CD} ${INSTALL_PATH}/

${TAR} ./basic.tar

${MV} ./basic/* .

${RM} ./basic.tar
${RM} ./basic

# make start script
# set env


${ECHO} install success
