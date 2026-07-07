#!bin/bash

# -------------------------
# Function: Logs Check
# -------------------------


log_check() {

    echo
    echo "========== LOG ANALYZER =========="
    echo

    echo "Report Generated : $(date)"

    echo

    echo "Last 20 Logs"

    journalctl --no-pager -n 20

    echo

    echo "Searching ERROR..."

    journalctl | grep ERROR

    echo

    echo "Searching WARNING..."

    journalctl | grep WARNING

    echo

    echo "Searching FAILED..."

    journalctl | grep FAILED

    echo

    echo "========== SSH LOGS =========="

    journalctl --no-pager -u sshd -n 20

    echo

    echo "========== DOCKER LOGS =========="

    journalctl --no-pager -u docker -n 20

    echo

    journalctl -no-pager -n 50 > reports/log_report.txt

    echo "Report saved successfully."

}


