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

