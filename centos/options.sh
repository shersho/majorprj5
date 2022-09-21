#!/bin/bash
echo Choose an option, 1 or 2:
echo 1\) Conclusion
echo 2\) Detailed Results
echo 3\) Report 
read opt

cd /root/mpgrp5/centos

if [ "$opt" == "1" ]
then
        echo "You have choosen option 1) Conclusion"
        source conclusion.sh
elif [ "$opt" == "2" ]
then
	echo "You have choosen option 2) Detailed Results"
	source report.sh
elif [ "$opt" == "3" ]
then
	echo "You have choosen option 3) Report"
	source cis-2.sh
	source cis-3.sh
else
	echo "No such option, or typo"
fi
