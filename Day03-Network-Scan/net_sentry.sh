#!/bin/bash

LOG_FILE="network_audit.txt"

echo "--- NETWORK PORT AUDIT ---" > $LOG_FILE
date >> $LOG_FILE
echo "--------------------------" >> $LOG_FILE

echo "[*] LISTENING PORTS (Open Windows):" >> $LOG_FILE
echo "FORMAT: Local_Address:Port  (Process_Name)" >> $LOG_FILE

# Command Explanation:
# ss  -> Socket Statistics (The Tool)
# -l  -> Listening (Waiting for connection)
# -n  -> Numeric (Show IPs, not names like 'localhost')
# -t  -> TCP (Most services use this)
# -u  -> UDP
# -p  -> Process (Show WHO opened the port)

sudo ss -lntup >> $LOG_FILE

echo "" >> $LOG_FILE
echo "[*] DANGEROUS PORT CHECK:" >> $LOG_FILE

# Check for Telnet (Port 23) - An ancient, insecure protocol
if grep -q ":23 " $LOG_FILE; then
    echo "⚠️  CRITICAL: TELNET DETECTED (Port 23)" >> $LOG_FILE
else
    echo "✅ No Telnet found." >> $LOG_FILE
fi
echo "" >> $LOG_FILE
echo "[*] PUBLIC EXPOSURE CHECK (0.0.0.0):" >> $LOG_FILE
if grep -q "0.0.0.0" $LOG_FILE; then
    echo "⚠️  WARNING: Some services are listening on ALL interfaces (0.0.0.0)!" >> $LOG_FILE
    echo "    Check the list above to ensure this is intentional." >> $LOG_FILE
else
    echo "✅ No services exposed to 0.0.0.0 (Good job)." >> $LOG_FILE
fi
echo "Scan Complete. View $LOG_FILE"

