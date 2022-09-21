#!/bin/bash
cd /root/mpgrp5/centos
printf "pass " && source ./cis-1.sh | grep -o "PASS" | wc -l
printf "fail " && source ./cis-1.sh | grep -o "FAIL" | wc -l
printf "warning " && source ./cis-1.sh | grep -o "WARNING" | wc -l

