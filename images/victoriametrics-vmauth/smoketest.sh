#!/usr/bin/env bash
# Drop-in compat with the chart-generated workload that hardcodes
# `exec /vmauth-prod` in its container command. Without the top-level
# symlink the container crashes at start with:
#   /bin/sh: exec: line 1: /vmauth-prod: not found
set -euo pipefail
. /smoketest/helpers.sh

assert_chart_cmd_paths /vmauth-prod
assert_help_runs /vmauth-prod --help
echo "ok"
