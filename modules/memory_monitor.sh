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
