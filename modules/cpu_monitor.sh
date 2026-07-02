#!bin/bash

# -------------------------
# Function: CPU Check
# -------------------------
cpu_check() {


    echo
    echo "======== CPU INFORMATION ======="

    uptime

    echo

    echo
    echo "CPU Cores : $(nproc)"
    echo
    echo
    echo "CPU Model :"

    lscpu | grep "Model name"


    echo

    echo "========== TOP CPU PROCESSES =========="


    ps aux --sort=-%cpu | head -6


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

