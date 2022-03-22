#!/bin/bash
echo 'Enter directory for archiving'
read source
echo 'Enter the directory to save the archive'
read destination
tar -czf name.tar.gz source
if ! [ -d destination ]; then
  echo "No directory"
  mkdir destination
fi
mv name.tar.gz destination
