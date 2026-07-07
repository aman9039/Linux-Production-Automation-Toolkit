#!/bin/bash

source modules/health_check.sh
source modules/disk_monitor.sh
source modules/memory_monitor.sh
source modules/cpu_monitor.sh
source modules/service_monitor.sh
source modules/network_monitor.sh
source modules/logs_monitor.sh
source modules/network_monitor.sh

while true
do	
  echo "===================================="
echo " Linux Production Automation Toolkit "
echo "===================================="
echo 
echo "1.Health Check"
echo "2.Disk Usage"
echo "3.Memory Usage"
echo "4.CPU Usage"
echo "5.service status"
echo "6.Log Analyzer"
echo "7.Network Monitor"
echo "8.Exit"
echo

read -p "Enter your choice (1-8): " choice

case $choice in
    1)
        health_check ;;
    2)
        disk_check ;;
    3)
        memory_check ;;
    4)
        cpu_check ;;
    5)
        service_check ;;
    6)
        log_check ;;
    7)
        network_check ;;	    
    8)  
        echo "Exiting Toolkit..."
        exit 0
        ;;	    
    *)
        echo "Invalid Choice!"
        ;;
esac
done
