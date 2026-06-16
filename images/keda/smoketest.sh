#!/bin/sh
# The keda helm chart hardcodes `command: ["/keda"]` on the operator
# Deployment. Without a top-level symlink the container crashes with:
#   exec: "/keda": no such file or directory
set -eu
. /smoketest/helpers.sh

assert_chart_cmd_paths /keda
echo "ok"
