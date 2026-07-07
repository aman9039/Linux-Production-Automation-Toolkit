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


