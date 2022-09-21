#!/bin/bash
cd /home/saihu/mpgrp5/ubuntu
./excel-a.sh | sed 's/ /;/g' > /home/saihu/mpgrp5/ubuntu/summary.csv
echo $'\e[0;91m'A summary has been downloaded at /home/saihu/mpgrp5/ubuntu folder$'\e[0m'
