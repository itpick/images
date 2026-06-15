#!/bin/sh
# Chart hardcodes `command: ["/keda-admission-webhooks"]` on the
# admission Deployment. See ../keda/smoketest.sh for backstory.
set -eu
. /smoketest/helpers.sh

assert_chart_cmd_paths /keda-admission-webhooks
echo "ok"
