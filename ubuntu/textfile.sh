#!/bin/bash
cd /home/saihu/mpgrp5/ubuntu
source newMP.sh > /home/saihu/mpgrp5/ubuntu/status.txt
source remediation.sh > /home/saihu/mpgrp5/ubuntu/remediation.txt
echo $'\e[0;91m'A copy of the benchmark status has been downloaded at /home/saihu/mpgrp5/ubuntu folder$'\e[0m'
echo $'\e[0;91m'Remediation measures are downloaded at /home/saihu/mpgrp5/ubuntu folder$'\e[0m'

