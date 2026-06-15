#!/usr/bin/env bash
# The keda helm chart hardcodes `command: ["/keda"]` on the operator
# Deployment. Without a top-level symlink the container crashes with:
#   exec: "/keda": no such file or directory
set -euo pipefail
. /smoketest/helpers.sh

assert_chart_cmd_paths /keda
echo "ok"
