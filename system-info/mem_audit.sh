#!/usr/bin/env bash
# ==============================================================================
# Script Name   : mem_audit.sh
# Description   : Detailed Linux Memory & Swap Diagnostic Report
# Author        : AMIT PADHAN (amitpadhan525)
# License       : MIT
# ==============================================================================

set -euo pipefail

# ANSI Color Palette
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

echo -e "${CYAN}${BOLD}╭──────────────────────────────────────────────────────────╮${NC}"
echo -e "${CYAN}${BOLD}│  🧠  LINUX MEMORY & RESOURCE AUDIT                       │${NC}"
echo -e "${CYAN}${BOLD}╰──────────────────────────────────────────────────────────╯${NC}"

# Parse /proc/meminfo
MEM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{printf "%.2f GB", $2/1024/1024}')
MEM_FREE=$(grep MemFree /proc/meminfo | awk '{printf "%.2f GB", $2/1024/1024}')
MEM_AVAIL=$(grep MemAvailable /proc/meminfo | awk '{printf "%.2f GB", $2/1024/1024}')
BUFFERS=$(grep Buffers /proc/meminfo | awk '{printf "%.2f MB", $2/1024}')
CACHED=$(grep "^Cached:" /proc/meminfo | awk '{printf "%.2f MB", $2/1024}')
SWAP_TOTAL=$(grep SwapTotal /proc/meminfo | awk '{printf "%.2f GB", $2/1024/1024}')
SWAP_FREE=$(grep SwapFree /proc/meminfo | awk '{printf "%.2f GB", $2/1024/1024}')

echo -e "\n${BOLD}📊 MEMORY ALLOCATION${NC}"
printf "  %-22s : ${GREEN}%s${NC}\n" "Total Physical RAM" "$MEM_TOTAL"
printf "  %-22s : ${GREEN}%s${NC}\n" "Available Memory" "$MEM_AVAIL"
printf "  %-22s : ${YELLOW}%s${NC}\n" "Free Memory" "$MEM_FREE"
printf "  %-22s : ${CYAN}%s${NC}\n" "Buffers" "$BUFFERS"
printf "  %-22s : ${CYAN}%s${NC}\n" "Page Cache" "$CACHED"

echo -e "\n${BOLD}💾 SWAP UTILIZATION${NC}"
printf "  %-22s : ${YELLOW}%s${NC}\n" "Total Swap Space" "$SWAP_TOTAL"
printf "  %-22s : ${GREEN}%s${NC}\n" "Free Swap Space" "$SWAP_FREE"

echo -e "\n${BOLD}🔥 TOP 5 MEMORY-CONSUMING PROCESSES${NC}"
printf "  ${BOLD}%-8s %-10s %-8s %-10s %-25s${NC}\n" "PID" "%MEM" "RSS (MB)" "USER" "COMMAND"
echo "  ------------------------------------------------------------------"
ps aux --sort=-%mem | awk 'NR>1 {printf "  %-8s %-10s %-8.1f %-10s %-25s\n", $2, $4, $6/1024, $1, $11}' | head -n 5

echo -e "\n${CYAN}✓ Audit completed successfully.${NC}"
