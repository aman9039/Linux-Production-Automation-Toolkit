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

