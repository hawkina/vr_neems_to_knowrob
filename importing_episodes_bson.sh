#!/bin/bash

#make fancy colors available
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color


cd 
cd ~/Desktop/episodes/Own-Episodes/set-clean-table/

# find all directories in episodes folder
folder=$(find . -maxdepth 1 -mindepth 1 -type d -printf '%f\n')

echo "found following directories:"
echo -e "${ORANGE} $folder ${NC}"

# go into each directory
for dir in $folder
do
	echo "\n ---"
	echo -e "going into ${ORANGE} $dir ${NC}"
	cd $dir
	# find bson file
	bsonfile=$(find . -maxdepth 1 -mindepth 1 -type f -name *.bson -printf '%f'
)
	filename=${bsonfile%*.bson}
	
	echo -e "file $bsonfile filename $filename \n"
	
	mongorestore -d Own-Episodes_set-clean-table -c $filename $bsonfile
	
	cd ..
done
	
echo "hopefully done with all :D" 
