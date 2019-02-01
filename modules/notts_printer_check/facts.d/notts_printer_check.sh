#!/bin/bash

printer=$(lpstat -p |awk '{print $2}')

if [ $printer = "KonicaMinoltaBizhubC3351" ]
then
  NY_Printer=true
else
  NY_Printer=false
fi
echo NY_Printer=$NY_Printer
