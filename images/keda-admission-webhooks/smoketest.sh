#!/usr/bin/env bash
# Chart hardcodes `command: ["/keda-admission-webhooks"]` on the
# admission Deployment. See ../keda/smoketest.sh for backstory.
set -euo pipefail
. /smoketest/helpers.sh

assert_chart_cmd_paths /keda-admission-webhooks
echo "ok"
