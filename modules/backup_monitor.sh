#------------------------------
# Backup and Cleanup Automation
#------------------------------

backup_check() {

    echo
    echo "========== BACKUP MODULE =========="
    echo

    DATE=$(date +%F-%H-%M-%S)
    BACKUP_DIR="/root/Linux-Production-Automation-Toolkit/backup"

    tar -czf "$BACKUP_DIR/etc-backup-$DATE.tar.gz" /etc >/dev/null 2>&1

    if [ -f "$BACKUP_DIR/etc-backup-$DATE.tar.gz" ]
    then 
        echo "✅ Backup created successfully."
    else 
       echo "❌ Backup failed."
    fi       

    echo

    echo "Available Backups:"

    ls -lh "$BACKUP_DIR"

    echo

    find "BACKUP_DIR" -type f -mtime +7 -delete

    echo "✅ Old backups cleanup completed."

    echo


}

