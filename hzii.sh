#!/bin/bash
# Hide ZIP-file in an image
# TODO:
# Check that the image is a GIF or a JPEG
# Error handling if zip is missing
# Error handling if too few arguments

ZIP=`which zip`
HIDDEN_ZIP=secret.zip
TMP_DIR=secret
IMG_FILE=$1

for 

$ZIP $HIDDEN_ZIP $TMP_DIR
cat $HIDDEN_ZIP >> $IMG_FILE
rm -rf $HIDDEN_ZIP
exit 0