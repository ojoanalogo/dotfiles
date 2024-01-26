#!/usr/bin/env python3
import subprocess
import json

# Run the "protonvpn-cli s" command and capture its output
try:
    vpn_status_output = subprocess.check_output(["protonvpn-cli", "s"], universal_newlines=True)
except subprocess.CalledProcessError as e:
    print("Error:", e)
    exit(1)

# Split the output into lines
vpn_status_lines = vpn_status_output.splitlines()

# Initialize a dictionary to store VPN status information
vpn_info = {}

# Parse the output and extract relevant information
for line in vpn_status_lines:
    parts = line.strip().split(':')
    if len(parts) == 2:
        key, value = parts[0].strip(), parts[1].strip()
        vpn_info[key] = value


data = {}

# Check if ProtonVPN is connected, vpn_info object has no keys
if len(vpn_info) == 0:
    print('<span color=\"#e57474\">󰦞</span>  <span color=\"#b3b9b8\">VPN offline</span>')
    exit(0)

print(f'<span color=\"#8ccf7e\">󰕥</span>  <span color=\"#b3b9b8\">{vpn_info["Server"]}</span>')
