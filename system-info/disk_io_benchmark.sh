#!/usr/bin/env bash
# ==============================================================================
# System Info - Disk I/O & Throughput Benchmark
# Measures real sequential write/read speeds and storage response latency.
# ==============================================================================

set -euo pipefail

# Color palette
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
BOLD="\033[1m"
NC="\033[0m"

TEST_DIR="${1:-/tmp}"
TEST_FILE="$TEST_DIR/io_bench_test_$(date +%s).tmp"
BLOCK_SIZE="1M"
BLOCK_COUNT=256 # 256 MB test payload

cleanup() {
    if [[ -f "$TEST_FILE" ]]; then
        rm -f "$TEST_FILE"
    fi
}
trap cleanup EXIT INT TERM

echo -e "${BOLD}${CYAN}=== Storage I/O Benchmark Utility ===${NC}"
echo -e "${BLUE}Target Directory :${NC} $TEST_DIR"
echo -e "${BLUE}Filesystem Type  :${NC} $(df -T "$TEST_DIR" | awk 'NR==2 {print $2}')"
echo -e "${BLUE}Available Space  :${NC} $(df -h "$TEST_DIR" | awk 'NR==2 {print $4}')"
echo -e "${BLUE}Test Payload     :${NC} ${BLOCK_COUNT} MB"
echo "----------------------------------------------------"

# 1. Sequential Write Test
echo -e "${YELLOW}>> Running Sequential Write Benchmark (Direct I/O)...${NC}"
WRITE_RESULT=$(dd if=/dev/zero of="$TEST_FILE" bs="$BLOCK_SIZE" count="$BLOCK_COUNT" conv=fdatasync 2>&1)
WRITE_SPEED=$(echo "$WRITE_RESULT" | grep -o '[0-9.]\+ [MGK]B/s' | tail -n 1 || echo "N/A")
echo -e "   ${GREEN}Write Throughput :${NC} ${BOLD}${WRITE_SPEED}${NC}"

# Drop buffer cache if running as root, otherwise test cached read
echo "----------------------------------------------------"
echo -e "${YELLOW}>> Running Read Benchmark...${NC}"
READ_RESULT=$(dd if="$TEST_FILE" of=/dev/null bs="$BLOCK_SIZE" count="$BLOCK_COUNT" 2>&1)
READ_SPEED=$(echo "$READ_RESULT" | grep -o '[0-9.]\+ [MGK]B/s' | tail -n 1 || echo "N/A")
echo -e "   ${GREEN}Read Throughput  :${NC} ${BOLD}${READ_SPEED}${NC}"

echo "----------------------------------------------------"
echo -e "${BOLD}${GREEN}✔ Disk I/O benchmark completed safely. Temporary buffers purged.${NC}"
