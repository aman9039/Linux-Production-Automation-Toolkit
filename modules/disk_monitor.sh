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

echo "===================================="
echo " Linux Production Automation Toolkit "
echo "===================================="
echo
echo "1.Health Check"
echo "2.Disk Usage"
echo "3.Memory Usage"
echo "4.CPU Usage"
echo "5.Exit"
echo

read -p "Enter your choice (1-5): " choice

case $choice in
     1)
        health_check
        ;;
     2)
        disk_check
        ;;
    3)
        memory_check
        ;;
    4)
        cpu_check
        ;;
    5)
        echo "Exiting Toolkit..."
        ;;
    *)
        echo "Invalid Choice!"
        ;;
esac

