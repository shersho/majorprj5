#!/bin/bash
cd /home/saihu/mpgrp5/ubuntu
printf "pass " && source ./newMP.sh | grep -o "PASS" | wc -l
printf "fail " && source ./newMP.sh | grep -o "FAIL" | wc -l
printf "warning " && source ./newMP.sh | grep -o "WARN" | wc -l
printf "manual " && source ./newMP.sh | grep -o "N/A" | wc -l
