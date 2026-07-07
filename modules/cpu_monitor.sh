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



