#!/bin/bash

pathToSearch=$1
pathToSaveFile=$2
echo -e "\n------------- path to search: $pathToSearch"
echo -e "main process:"
cd "$pathToSearch"
find ./* -type d -print0 | while read -d $'\0' file; do
	#basename1=$(basename "$file")
	fileSize=$(du -h --max-depth=0 "$file")
	#This checksum counts every byte in files and folders:
	#checksum=$(cd "$file" && find . -type f -print0 | while read -d $'\0' fileInner; do checksumInner=$(cksum "$fileInner"); echo "$checksumInner"; done | cksum && cd ..)c
	echo -e "$fileSize\t$checksum" >> $pathToSaveFile/tmpfile

done

echo -e "------------- end at $(date)"






