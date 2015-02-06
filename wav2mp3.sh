#!/bin/bash
INFOFILE="$2"
FROM=`pwd`
cd "$1"
COUNTER=0
for i in *.wav; do
	if [ -e "$i" ]; then
		COUNTER=$[$COUNTER+1]
		FILE=`basename "$i" .wav`
		ROW=$[COUNTER+4]
		ARTIST=`sed -n 1p $INFOFILE`
		ALBUM=`sed -n 2p $INFOFILE`
		RELEASEYEAR=`sed -n 3p $INFOFILE`
		GENRE=`sed -n 4p $INFOFILE`
		SONG=`sed -n ${ROW}p $INFOFILE`
		TRACK=`printf %02d $COUNTER`
		NEWFILENAME="$TRACK - $ARTIST - $SONG"
		echo $NEWFILENAME
		lame -h -b 320 "$i" "$NEWFILENAME.mp3"
		id3v2 --artist "$ARTIST" --album "$ALBUM" --year "$RELEASEYEAR" --genre "$GENRE" --song "$SONG" --track "$TRACK" "$NEWFILENAME.mp3"
	fi
done
cd $FROM
