#!bin/bash

# -------------------------
# Function: Health Check
# -------------------------
health_check() {
    echo
    echo "========== HEALTH CHECK =========="
    echo "Hostname      : $(hostname)"
    echo "Current User  : $(whoami)"
    echo "Date          : $(date)"
    echo "Uptime        : $(uptime -p)"
    echo "Kernel Version: $(uname -r)"
    echo "OS            : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
    echo "IP Address    : $(hostname -I)"
    echo "=================================="
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

