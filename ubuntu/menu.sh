#!/usr/bin/env bash

lightaqua=`echo -en "\e[96m"`
bold=$(tput bold)
normal=$(tput sgr0)
default=`echo -en "\e[39m"`

{
echo "${lightaqua}${bold}Choose 1 of the following options: ${normal}${default}" 
echo " "
echo "1) Benchmark Status"
echo "2) Benchmark Remediation"
echo "3) Conclusion"
echo "4) Download Report"

echo " "

read -p "Enter your option here: " NUMBER

echo " "

if [ $NUMBER == 1 ]
then
	source /home/saihu/mpgrp5/ubuntu/report-a.sh
elif [ $NUMBER == 2 ]
then
	source /home/saihu/mpgrp5/ubuntu/remediation-a.sh
	source /home/saihu/mpgrp5/ubuntu/remediation.sh
elif [ $NUMBER == 3 ]
then
	source /home/saihu/mpgrp5/ubuntu/conclusion-a.sh
elif [ $NUMBER == 4 ]
then
	source /home/saihu/mpgrp5/ubuntu/excelfile.sh
	source /home/saihu/mpgrp5/ubuntu/textfile.sh
fi
}
