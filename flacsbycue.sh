#!/bin/bash
FLACFILE=$1
CUEFILE=${FLACFILE%.*}.cue
cuebreakpoints $CUEFILE | shnsplit -o flac -O always $FLACFILE
cuetag.sh $CUEFILE split-track*.flac
# Read titles from .cue-file
TRACKLIST=`grep TITLE $CUEFILE | sed -e 's/.*TITLE.*\"\(.*\)\"/\1/g' | sed -e 's/[[:space:]]/___/g'`
COUNT=0
TRACKNUM=0
for T in $TRACKLIST
do
	let COUNT=COUNT+1
	#Skip the first title since it is (or should be) the album title	
	if [ $COUNT -gt 1 ]; then
		let TRACKNUM=COUNT-1
		TMP=`printf "%02d" "$TRACKNUM"`
		TRACKTITLE=`echo $T | sed -e 's/___/\ /g'`
		mv split-track$TMP.flac "$TMP $TRACKTITLE.flac"
	fi
done
