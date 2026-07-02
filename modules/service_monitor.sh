#!bin/bash

# -------------------------
# Function: Service Check
# -------------------------
check_service() {


service=$1

sudo systemctl restart "$service"

status=$(systemctl is-active "$service")

if [ "$status" = "active" ]
then
    echo "$service restarted successfully."
else
    echo "Failed to restart $service."
fi

}

service_check() {


  echo
    echo "========== SERVICE STATUS =========="
    echo
    echo "Checking SSH Service..."

    check_service sshd
    check_service docker
    check_service jenkins


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
echo "5.service status"
echo "6.Exit"
echo

read -p "Enter your choice (1-6): " choice

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
        service_check
        ;;
    *)
        echo "Invalid Choice!"
        ;;
esac

