#!/bin/sh
echo `hostname -f`>>./logs/log.txt
echo "------------------------ Test 1 --------------------------" >> ./logs/log.txt
echo "#Проверка времени работы сервера">> ./logs/log.txt
echo "- Output: " >> ./logs/log.txt
echo `uptime` >> ./logs/log.txt
echo "- Result: " >> ./logs/log.txt

##
echo "INFO: Uptime is greater than day" >> ./logs/log.txt 
echo "WARNING: Uptime is less than or equal day" >> ./logs/log.txt
## 
echo "----------------------------------------------------------" >> ./logs/log.txt
echo "----------------------------------------------------------" >> ./logs/log.txt
