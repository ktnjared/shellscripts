#!/bin/sh
# 
# from a comment by
# klanomath, 2016-10-02 15:54 EDT, https://apple.stackexchange.com/a/255551
# 
# modified by Jared Schmidt 2023-02-08 05:18 UTC

OS=`uname -s`
REV=`uname -r`
MACH=`uname -m`
if [ "${OS}" = "Darwin" ]; then
    OIFS="$IFS"
    IFS=$'\n'
    set `sw_vers` > /dev/null
    DIST=`echo $1 | tr "\n" ' ' | sed 's/ProductName:[ ]*//'`
    VERSION=`echo $2 | tr "\n" ' ' | sed 's/ProductVersion:[ ]*//'`
    BUILD=`echo $3 | tr "\n" ' ' | sed 's/BuildVersion:[ ]*//'`
    OSSTR="${OS} ${DIST} ${VERSION} ${BUILD} ${MACH}"
    IFS="$OIFS"
fi
echo ${OSSTR}