#!/bin/bash
./excel-a.sh | sed 's/ /;/g' > /root/mpgrp5/debian/report.csv
echo $'\e[0;91m'report.csv has been created in /root/mpgrp5/debian folder$'\e[0m'
