#!bin/bash

# -------------------------
# Function: Memory Check
# -------------------------

memory_check() {

    echo
    echo "=============Memory Usage==========="

    free -h

    echo
    echo "========== TOP MEMORY PROCESSES =========="

    ps aux --sort=-%mem | head -6

    echo
    echo
    echo "========== SWAP =========="
    swapon --show


    echo

    total_mem=$(free | awk '/Mem:/ {print $2}')
    used_mem=$(free | awk '/Mem:/ {print $3}')
    memory_percentage=$(( used_mem * 100 / total_mem ))

    echo "Memory Usage : ${memory_percentage}%"
    if [ "$memory_percentage" -ge 90 ]
    then
       echo "Warning! memory usage is above 90%"
    else
       echo "Memory usage is normal"
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

