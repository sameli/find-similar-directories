## find-similar-directories

This project contains a bash script to find similar directories very efficiently. It looks for folders recursively and calculates their checksum. Then we can sort them based on size. This is very useful in situations where you need to quickly refactor similar directories and resources in very large projects. Example:

````
./find-similar-folders.sh sourceDir dirToSaveTmpfile
sort -rh tmpfile | awk -f duplicates.awk | head
