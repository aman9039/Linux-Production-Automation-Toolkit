#!bin/bash
# -------------------------
# Function: Network Check
# -------------------------


network_check() {

    echo
    echo "========== NETWORK INFORMATION =========="
    echo
    echo "Server IP Address"

    hostname -I

    echo
    echo "========== NETWORK INTERFACES =========="

    ip -br addr

    echo
    echo "========== INTERNET CONNECTIVITY =========="

    if ping -c 2 8.8.8.8 >/dev/null 2>&1
    then
        echo "Internet : Connected"
    else
       echo "Internet : Not Reachable"
    fi

    
    echo
    echo "========== DNS =========="
    if nslookup google.com >/dev/null 2>&1
    then 
       echo "DNS Resolution : Working"
    else
       echo "DNS Resolution : Failed"
    fi

 
    echo
    echo "========== LISTENING PORTS =========="

    ss -tunlp

    echo   
    echo "Listening Ports"

    ss -tunlp | grep -E "22|80|443|8080|9090|9100|3000"

    echo
    echo
    echo "========== DEFAULT GATEWAY =========="

    ip route | grep default

    echo
    echo
    echo "========== DNS SERVER =========="

    cat /etc/resolv.conf

    echo
    echo "========== FIREWALL STATUS =========="

    firewall-cmd --state

    echo

    firewall-cmd --list-all

    echo
    

}
