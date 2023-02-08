#!/bin/sh
# 
# from a comment by
# klanomath, 2016-10-02 15:54 EDT, https://apple.stackexchange.com/a/255551
# 
# modified by Jared Schmidt 2023-02-08 05:18 UTC
# expected output as of today: 
#   Darwin macOS 13.2 22D49 arm64

OS=$(uname -s)
MACH=$(uname -m)
if [ "${OS}" = "Darwin" ]; then
    OIFS=$IFS
    IFS=$'\n'
    set "$(sw_vers)" > /dev/null
    DIST=$(sw_vers | awk 'NR==1' | tr "\n" ' ' | sed 's/ProductName:[ ]*//' | awk '{$1=$1};1')
    VERSION=$(sw_vers | awk 'NR==2' | tr "\n" ' ' | sed 's/ProductVersion:[ ]*//' | awk '{$1=$1};1')
    BUILD=$(sw_vers | awk 'NR==3' | tr "\n" ' ' | sed 's/BuildVersion:[ ]*//' | awk '{$1=$1};1')
    OSSTR="${OS} ${DIST} ${VERSION} ${BUILD} ${MACH}"
    IFS="$OIFS"
fi
echo "${OSSTR}"