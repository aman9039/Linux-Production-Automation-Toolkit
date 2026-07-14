#!/bin/bash

source modules/health_check.sh
source modules/disk_monitor.sh
source modules/memory_monitor.sh
source modules/cpu_monitor.sh
source modules/service_monitor.sh
source modules/network_monitor.sh
source modules/logs_monitor.sh
source modules/network_monitor.sh
source modules/security_monitor.sh
source modules/backup_monitor.sh
source modules/user_management.sh




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
echo "8.Security Monitoring"
echo "9.Backup and Cleanup"
echo "10.User Management"
echo "11.Exit"
echo

read -p "Enter your choice (1-11): " choice

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
        security_check ;;
    9)
        backup_check ;;
    10)
        user_management ;;	    
    11)  
         echo "Exiting Toolkit..."
         exit 0
         ;;	    
    *)
         echo "Invalid Choice!"
         ;;
esac
done
