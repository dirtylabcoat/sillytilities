#!/bin/bash
DBFILE=$1
OUTFILE=$2

#Check for correct number of arguments
if [ ! $# -eq 2 ]; then
	echo "Usage: access2mysql.sh DBFILE OUTPUTFILE"
	echo "Example: access2mysql.sh msaccess.mdb mysql.sql"
	exit 1
fi
#Check that DBFILE really exists
if [ ! -f $DBFILE ]; then
	echo "$DBFILE does not exist."
	exit 1
fi

#All is good, here we go!

#Create schema
mdb-schema -S $DBFILE mysql > $OUTFILE

#Export table data
TABLES=`mdb-tables $DBFILE`
for T in $TABLES; do
	mdb-export -I -R';\n' $DBFILE $T >> $OUTFILE
done
#Clean up some Windows-character stuff
dos2unix $OUTFILE
exit 0

