#!bin/bash
#----------------
# User Management
# ---------------

user_management() {
 

    echo
    echo "========== USER MANAGEMENT =========="
    echo
    echo "Users in system:"
    awk -F: '$3 >= 1000 {print NR,$1}' /etc/passwd    
    echo
    echo "Logged in users:"

    who
    echo
    echo "Locked users:"
    passwd -S $(awk -F: '$3 >=1000 {print NR,$1}' /etc/passwd) 2>/dev/null | grep " L "
    echo
    echo "Available Users:"
    awk -F: '$3 >= 1000 && $3 < 65534 {print NR,$1}' /etc/passwd


    echo
    read -p "Enter username:" user

    if id "$user" &>/dev/null
    then
	    chage -l "$user"
    else	
	   echo "❌ User does not exist."
    fi   	   
}
