# Bash Script Here
#!/bin/bash

# Set directory and file names
TARGET_DIR="/tmp/bashscript"
RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

STATUS_FILE="$TARGET_DIR/status_report_${RANDOM_NUMBER}.txt"

# Create the directory (if it doesn't exist)
mkdir -p "$TARGET_DIR"

# Gather system info and write to the file
{
    echo "==== System Status Report ===="
    echo "Generated on: $(date)"
    echo ""

    echo "---- Hostname ----"
    hostname
    echo ""

    echo "---- Uptime ----"
    uptime
    echo ""

    echo "---- CPU Info ----"
    lscpu
    echo ""

    echo "---- Memory Usage ----"
    free -h
    echo ""

    echo "---- Disk Usage ----"
    df -h
    echo ""

    echo "---- Running Processes (top 5) ----"
    ps aux --sort=-%cpu | head -n 6
    echo ""

    echo "---- Network Interfaces ----"
    ip addr show
    echo ""

    echo "==== End of Report ===="
} > "$STATUS_FILE"

# Optional: show where the report was saved
echo "System status report saved to: $STATUS_FILE"
