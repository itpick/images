#!/usr/bin/env bash
# Run Helm chart deployment tests
set -euo pipefail

CLUSTER_NAME="${1:-nix-containers-test}"
CATEGORY="${2:-all}"
CHART="${3:-}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHARTS_DIR="$(dirname "$SCRIPT_DIR")/charts"
RESULTS_DIR="$(dirname "$SCRIPT_DIR")/results"

# Setup results directory
mkdir -p "$RESULTS_DIR"
RESULTS_LOG="$RESULTS_DIR/test-results.log"
RESULTS_JSON="$RESULTS_DIR/test-results.json"

# Initialize results
echo "=== Test Results ===" > "$RESULTS_LOG"
echo "Timestamp: $(date -Iseconds)" >> "$RESULTS_LOG"
echo "" >> "$RESULTS_LOG"

# JSON results
echo '{"timestamp": "'$(date -Iseconds)'", "results": [' > "$RESULTS_JSON"

# Set kubeconfig
export KUBECONFIG="${HOME}/.kube/kind-${CLUSTER_NAME}"

if [ ! -f "$KUBECONFIG" ]; then
    echo "ERROR: Kubeconfig not found: $KUBECONFIG"
    echo "Run 'make cluster-up' first"
    exit 1
fi

echo "=== Running tests on Kind cluster: $CLUSTER_NAME ==="
echo "Category: $CATEGORY"
echo ""

# Source helpers
source "$SCRIPT_DIR/helpers.sh"

# Test counter
TOTAL=0
PASSED=0
FAILED=0
FIRST_RESULT=true

run_test() {
    local test_script="$1"
    local chart_name
    chart_name=$(basename "$test_script" .sh | sed 's/^test-//')
    local category
    category=$(basename "$(dirname "$test_script")")

    TOTAL=$((TOTAL + 1))
    echo "[$TOTAL] Testing $category/$chart_name..."

    local status="pass"
    local message=""

    if bash "$test_script" 2>&1; then
        PASSED=$((PASSED + 1))
        echo "  PASS: $chart_name"
        message="Test passed"
    else
        FAILED=$((FAILED + 1))
        echo "  FAIL: $chart_name"
        status="fail"
        message="Test failed"
    fi

    # Log result
    echo "[$status] $category/$chart_name: $message" >> "$RESULTS_LOG"

    # JSON result
    if [ "$FIRST_RESULT" = true ]; then
        FIRST_RESULT=false
    else
        echo "," >> "$RESULTS_JSON"
    fi
    echo '  {"category": "'$category'", "chart": "'$chart_name'", "status": "'$status'", "message": "'$message'"}' >> "$RESULTS_JSON"
}

# Find and run tests
if [ "$CATEGORY" = "all" ]; then
    # Run all tests
    for category_dir in "$CHARTS_DIR"/*/; do
        if [ -d "$category_dir" ]; then
            for test_script in "$category_dir"/test-*.sh; do
                if [ -f "$test_script" ]; then
                    run_test "$test_script"
                fi
            done
        fi
    done
elif [ "$CATEGORY" = "chart" ] && [ -n "$CHART" ]; then
    # Run specific chart test
    for test_script in "$CHARTS_DIR"/*/test-"$CHART".sh; do
        if [ -f "$test_script" ]; then
            run_test "$test_script"
        fi
    done
else
    # Run category tests
    category_dir="$CHARTS_DIR/$CATEGORY"
    if [ -d "$category_dir" ]; then
        for test_script in "$category_dir"/test-*.sh; do
            if [ -f "$test_script" ]; then
                run_test "$test_script"
            fi
        done
    else
        echo "ERROR: Category not found: $CATEGORY"
        exit 1
    fi
fi

# Finalize JSON
echo '' >> "$RESULTS_JSON"
echo '], "summary": {"total": '$TOTAL', "passed": '$PASSED', "failed": '$FAILED'}}' >> "$RESULTS_JSON"

# Print summary
echo ""
echo "=== Test Summary ==="
echo "Total:  $TOTAL"
echo "Passed: $PASSED"
echo "Failed: $FAILED"
echo ""
echo "Results saved to:"
echo "  $RESULTS_LOG"
echo "  $RESULTS_JSON"

# Exit with failure if any tests failed
[ "$FAILED" -eq 0 ]
