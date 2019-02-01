#!/bin/bash

file="/blob/UNiBLOB.txt"
if [ -f "$file" ]
then
  UNiBLOB_osx=true
else
  UNiBLOB_osx=false
fi
echo UNiBLOB_osx=$UNiBLOB_osx
