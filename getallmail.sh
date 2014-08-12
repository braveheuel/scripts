#!/bin/bash
#
set -e

if [ -e $HOME/.offline ]
then
	echo "getallmail offline..."
	exit 1
fi
rcfiles=""
for file in $HOME/.getmail/*rc ; do
   rcfiles="$rcfiles --rcfile=$file"
done
/usr/bin/getmail $rcfiles $@
