echo "=== Scan Status Check ==="
echo ""

# Check if any scans are still running on nixtop
echo "Checking nixtop for running processes..."
env -i HOME=$HOME PATH=/usr/bin:/bin ssh nixtop "ps aux | grep -E 'scan-from-list|grype|syft' | grep -v grep" 2>/dev/null || echo "No scans running"

echo ""
echo "=== Final Results ==="
echo "Local scan results: $(find images -name 'scan-summary.json' | wc -l | tr -d ' ') images"

echo ""
echo "=== Vulnerability Totals ==="
CRITICAL=$(find images -name 'scan-summary.json' -exec jq -r '.vulnerabilities.critical // 0' {} \; 2>/dev/null | awk '{s+=$1} END {print s+0}')
HIGH=$(find images -name 'scan-summary.json' -exec jq -r '.vulnerabilities.high // 0' {} \; 2>/dev/null | awk '{s+=$1} END {print s+0}')
MEDIUM=$(find images -name 'scan-summary.json' -exec jq -r '.vulnerabilities.medium // 0' {} \; 2>/dev/null | awk '{s+=$1} END {print s+0}')
LOW=$(find images -name 'scan-summary.json' -exec jq -r '.vulnerabilities.low // 0' {} \; 2>/dev/null | awk '{s+=$1} END {print s+0}')

echo "Critical: $CRITICAL"
echo "High: $HIGH"
echo "Medium: $MEDIUM"
echo "Low: $LOW"
echo "Scan status check complete."