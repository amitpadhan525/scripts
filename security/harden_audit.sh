#!/usr/bin/env bash
# System Security Hardening Audit
set -euo pipefail

echo "=== Linux Security & Hardening Baseline Audit ==="
echo "Date: $(date -u)"
echo "Host: $(hostname)"
echo "Kernel: $(uname -r)"

echo -e "\n[+] Checking Umask:"
umask

echo -e "\n[+] Checking World-Writable Files in /tmp:"
find /tmp -maxdepth 2 -type f -perm -0002 2>/dev/null | head -n 5 || echo "None found"

echo -e "\n[+] Checking Open Listening TCP Ports:"
ss -tulpn 2>/dev/null | grep LISTEN || netstat -tulpn 2>/dev/null | grep LISTEN || echo "No listener details available"

echo -e "\n=== Audit Complete ==="
