#!/bin/bash

#./run.sh sourceDir dirToSaveTmpfile
#sort -rh tmpfile | awk -f duplicates.awk | head

#sourceDir=$1
#sourceBaseName=$(basename "$sourceDir")
pathToSearch=$1
pathToSaveFile=$(pwd $2)
#exit 0
#files=$(find "$pathToSearch" -type d)
#list=()
#listBasename=()
counter=0
rm -f tmpfile
echo -e "\n------------- path to search: $pathToSearch"
echo -e "counting dirs"
countdirs=$(find "$pathToSearch" -type d | wc -l)
echo -e "main process:"
cd "$pathToSearch"
find ./* -type d -print0 | while read -d $'\0' file; do
	#basename1=$(basename "$file")
	fileSize=$(du -h --max-depth=0 "$file")
	#This checksum counts every byte in files and folders:
	#checksum=$(cd "$file" && find . -type f -print0 | while read -d $'\0' fileInner; do checksumInner=$(cksum "$fileInner"); echo "$checksumInner"; done | cksum && cd ..)
	#This checksum counts only file and folder names
	checksum=$(cd "$file" && ls -R | cksum && cd ..)
	echo -e "$fileSize\t$checksum" >> $pathToSaveFile/tmpfile
	((counter++))

	if [ $(($counter % 100)) -eq 0 ]; then
		echo "$counter of $countdirs"
	fi
	#list+=("$file")
	#listBasename+=("$file1")
	#echo -e "basename: $basename \n"
done



echo -e "------------- end at $(date)"






