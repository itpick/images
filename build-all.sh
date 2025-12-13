#!/bin/bash

# Get all images
IMAGES=$(nix eval --json .#imageNames 2>/dev/null | jq -r '.[]' | grep -v PACKAGE_SUMMARY)
TOTAL=$(echo "$IMAGES" | wc -l | tr -d ' ')

echo "Building $TOTAL images..."
echo "Start: $(date)"

# Initialize log files 
SUCCESS_LOG="build-success.log"
FAIL_LOG="build-fail.log"
> "$SUCCESS_LOG"
> "$FAIL_LOG"

COUNT=0
SUCCESS=0
FAIL=0

for img in $IMAGES; do
    COUNT=$((COUNT + 1))
    printf "[%d/%d] %s... " "$COUNT" "$TOTAL" "$img"
    
    if nix build ".#$img" --no-link 2>/dev/null; then
        echo "OK"
        echo "$img" >> "$SUCCESS_LOG"
        SUCCESS=$((SUCCESS + 1))
    else
        echo "FAIL"
        echo "$img" >> "$FAIL_LOG"
        FAIL=$((FAIL + 1))
    fi
    
    # Progress every 100
    if [ $((COUNT % 100)) -eq 0 ]; then
        echo "=== Progress: $COUNT/$TOTAL (OK: $SUCCESS, FAIL: $FAIL) ==="
    fi
done

echo ""
echo "=== BUILD COMPLETE ==="
echo "End: $(date)"
echo "Total: $TOTAL | Success: $SUCCESS | Failed: $FAIL"
