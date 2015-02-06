#!/bin/bash
PRINTCMD="println"
if [ ! "$1" == "" ]; then
  PRINTCMD=$1
fi
echo $PRINTCMD
grep -RIn "$PRINTCMD" *
#echo $PWD
