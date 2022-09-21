#!/bin/bash
cd /root/mpgrp5/debian
source 2_services-a.sh > /root/mpgrp5/debian/report.txt
source remediation-a.sh > /root/mpgrp5/debian/remediation.txt
echo $'\e[0;91m'A copy of the benchmark report would be viewable at /root/mpgrp5/debian/report.txt$'\e[0m'
echo $'\e[0;91m'Remediations can be found in /root/mpgrp5/debian/remediation.txt$'\e[0m'

