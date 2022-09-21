#!/bin/bash
cd /root/mpgrp5/centos
./excel.sh | sed 's/ /;/g' > /root/mpgrp5/centos/report.csv
echo "report.csv has been created in /root/mpgrp5/centos folder"
