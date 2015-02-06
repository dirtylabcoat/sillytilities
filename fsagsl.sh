#!/bin/bash
# fsagsl.sh Find String And Grab Some Lines
# 2009 (c) IDontGiveASmegWhatYouDoWithIt License
# by FighterHayabusa <fighterhayabusa@barbedwirebytecodebaconburger.com>
# Finds a string in a text-file and then outputs
# a chosen number of lines from that position onwards.

function is_int()
{
    [ "$1" -eq "$1" ] > /dev/null 2>&1
    return $?
}

PRG=fsagsl.sh

if [ -f $3 ] && is_int $2; then
		LINESTART=`grep -n $1 $3 | sed -e 's/\([0-9]*\):.*/\1/g'`
		for L in $LINESTART; do
			let LINESTOP=$L+$2
			sed -n "${L},${LINESTOP}p" $3
		done
		exit 0
else
	echo "ERROR: Invalid parameters."
	echo "Usage: ./$PRG string_to_find number_of_lines filename"
	echo "Example: ./$PRG \"Backup started\" 5 /var/log/messages"
	exit 1
fi


