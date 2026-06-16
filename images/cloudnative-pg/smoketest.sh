#!/bin/sh
# Regression check for the chart-cmd-path bug pattern. The
# cloudnative-pg helm chart hardcodes `command: ["/manager"]` on the
# operator Deployment; without a `/manager` symlink the pod fails at
# start with `exec: "/manager": no such file or directory`.
set -eu
. /smoketest/helpers.sh

assert_chart_cmd_paths /manager
echo "ok"
