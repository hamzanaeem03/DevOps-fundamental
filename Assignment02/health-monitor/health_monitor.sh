#!/bin/bash

echo "===== SYSTEM HEALTH CHECK ====="
echo "Date: $(date)"

# CPU Info (basic)
echo ""
echo "CPU Info:"
wmic cpu get Name,LoadPercentage /format:list 2>/dev/null | grep -v '^$'

# Memory Info (basic)
echo ""
echo "Memory Info:"
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /format:list 2>/dev/null | grep -v '^$'

# Disk Info
echo ""
echo "Disk Info:"
df -h

# Uptime (approximate)
echo ""
echo "System Uptime (approx.):"
net stats workstation | grep "Statistics since" || echo "Uptime not available on this shell"

echo ""
echo "===== END OF REPORT ====="
