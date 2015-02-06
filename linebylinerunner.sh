#!/bin/bash

FILE=$1

echo "A word of WARNING: Do not run scripts containing loops using this script."

while read -u 666 -r LINE
do
  echo -n "Run [ $LINE ] ? [Y/n] " ; read YORN
  if ! echo $YORN | grep -c "^[Yn]$" > /dev/null ; then
    YORN="Y"
  fi
  if [ "$YORN" == "Y" ] ; then
    echo ">> Running [ $LINE ] now."
    $LINE
  else
    echo ">> Skipping [ $LINE ]."
  fi
done 666<$FILE
exit 0

