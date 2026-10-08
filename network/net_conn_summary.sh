#!/usr/bin/env bash
# Network Active Connection Summary
set -euo pipefail

echo "=== Active Network Connection Summary ==="
echo "Host: $(hostname)"
echo "Timestamp: $(date -u)"

echo -e "\n[+] Network Interface Status:"
ip -brief address show || ifconfig -s || echo "ip command not available"

echo -e "\n[+] Active Established TCP Connections:"
ss -t -state established 2>/dev/null || netstat -t 2>/dev/null | grep ESTABLISHED || echo "None found"

echo -e "\n[+] Top 5 Remote Hosts Connected:"
ss -nt state established 2>/dev/null | awk '{print $4}' | cut -d: -f1 | sort | uniq -c | sort -nr | head -n 5 || echo "No active connections"

echo -e "\n=== Summary Complete ==="
