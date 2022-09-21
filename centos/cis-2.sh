#!/bin/bash
cd /root/mpgrp5/centos
source cis-1.sh > /root/mpgrp5/centos/report.txt
source remediation.sh > /root/mpgrp5/centos/remediation.txt
echo "A copy of the benchmark report would be viewable at /root/mpgrp5/centos/report.txt"
echo "Remediations can be found in /root/mpgrp5/centos/remediation.txt"
