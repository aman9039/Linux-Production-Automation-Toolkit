#!bin/bash

#-------------------------
# Function: Security Check
# ------------------------

security_check() {
	
echo
echo "============== SECURITY CHECK ============="
echo
echo "Logged In Users:"
who

echo
echo "Recent Login History:"

last | head -10

echo
echo "Failed Login Attempts:"

lastb | head -10

echo
echo "Failed SSH Attempts:"

journalctl --no-pager -u sshd | grep "Failed password check" | tail -10

echo
echo "Root SSH Login Setting:"

grep "^PermitRootLogin" /etc/ssh/sshd_config

echo
echo "Users with UID 0:"
awk -F: '$3 == 0 {print $1}' /etc/passwd
echo

echo "Sudo Users:"
getent group wheel
echo

}
