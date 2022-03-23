#!/bin/bash
$1
$2
name=$(echo $1 | sed 's/\/$//g' | sed -n '/.*\//s///p')
date=$(date '+%Y-%m-%dT%k:%M:%S%:z')
filename=$name-$date.tar.gz
tar -czf $filename $1
if ! [ -d $2 ]; then
  echo "No directory"
  mkdir $2
fi
mv $filename $2
