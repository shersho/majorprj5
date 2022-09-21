#!/bin/bash
cd /root/mpgrp5/debian
printf "pass " && source ./2_services-a.sh | grep -o "PASS" | wc -l
printf "fail " && source ./2_services-a.sh | grep -o "FAIL" | wc -l
printf "warning " && source ./2_services-a.sh | grep -o "WARNING" | wc -l
printf "not-tested " && source ./2_services-a.sh | grep -o "N/A" | wc -l
