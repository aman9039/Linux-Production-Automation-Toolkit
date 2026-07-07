#!bin/bash

# -------------------------
# Function: Disk Check
# -------------------------
disk_check(){
     echo
     echo "========== DISK USAGE =========="

     df -h

     echo
     echo "================================"

     du -sh /* 2>/dev/null

     echo
     echo "========== FILES LARGER THAN 500 MB =========="

     find / -type f -size +500M 2>/dev/null

     echo


     disk_usage=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

     echo "Root Disk Usage : ${disk_usage}%"

     if [ "$disk_usage"-ge 80 ]
     then
         echo "WARNING! Disk usage is above 80%"
     else
         echo "Disk usage is normal."
     fi

     echo     
}

