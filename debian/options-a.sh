#!/bin/bash
echo Choose an option, 1, 2, or 3:
echo 1\) Conclusion
echo 2\) Detailed Results
echo 3\) Report
read opt

if [ "$opt" == "1" ]
then
        echo "You have choosen option 1) Conclusion"
        source /root/mpgrp5/debian/conclusion-a.sh
elif [ "$opt" == "2" ]
then
        echo "You have choosen option 2) Detailed Results"
        source /root/mpgrp5/debian/report-a.sh

elif [ "$opt" == "3" ]
then
        echo "You have choosen option 3) Report"
        source /root/mpgrp5/debian/2_services-b.sh
        source /root/mpgrp5/debian/2_services-c.sh
else
        echo "No such option, or typo"
fi
