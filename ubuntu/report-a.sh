#!/bin/bash
cd /home/saihu/mpgrp5/ubuntu
echo
source newMP.sh
echo
PCOUNTER=$(./newMP.sh | grep "PASS" | wc -l)
FCOUNTER=$(./newMP.sh | grep "FAIL" | wc -l)
WCOUNTER=$(./newMP.sh | grep "WARN" | wc -l)
NCOUNTER=$(./newMP.sh | grep "N/A" | wc -l)
item=$PCOUNTER
total=$(($PCOUNTER + $FCOUNTER + $WCOUNTER + $NCOUNTER))
percent=$((200*$item/$total % 2 + 100*$item/$total))

mysql -e"
CREATE DATABASE tab;
USE tab;
CREATE TABLE tab1( STATUS VARCHAR(50) NOT NULL, Pass VARCHAR(50) NOT NULL, Fail VARCHAR(50) NOT NULL, Warning VARCHAR(50) NOT NULL, Not_tested VARCHAR(50) NOT NULL, Score VARCHAR(50) NOT NULL, Max VARCHAR (50) NOT NULL, Percent VARCHAR (50) NOT NULL);
INSERT INTO tab1 (STATUS, Pass, Fail, Warning, Not_tested, Score, Max, Percent) VALUES ( 'NUMBER','$PCOUNTER','$FCOUNTER','$WCOUNTER', '$NCOUNTER', '$item', '$total', '$percent%');
SELECT * FROM tab1;
DROP DATABASE tab;
"
