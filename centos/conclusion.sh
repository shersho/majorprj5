#!/bin/bash
cd /root/mpgrp5/centos
source cis-1.sh | tail -6
#pn=$(source ./2_services-1.sh | grep -o $PCOUNTER | wc -l)
#fn=$(source ./2_services-1.sh | grep -o $FCOUNTER | wc -l)
#wn=$(source ./2_services-1.sh | grep -o $WCOUNTER | wc -l)
#nn=$(source ./2_services-1.sh | grep -o "Not Tested" | wc -l)

#echo ---------------------------------------------------------------------------------------
#printf "%-77s %s\n" CONCLUSION "Status"
#echo ---------------------------------------------------------------------------------------
#if [[ "$pn" -lt 14 ]]
#then
#        printf "%-77s %s\n" "There are $pn pass(es), $fn fail(s) and $wn warning(s)" "critical"
#else
#        printf "%-77s %s\n" "There are $pn pass(es), $fn fail(s) and $wn warning(s)" "safe"
#fi

