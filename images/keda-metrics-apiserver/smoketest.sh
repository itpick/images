#!/bin/sh
# Chart hardcodes `command: ["/keda-adapter"]` on the metrics-apiserver
# Deployment. The image is named `keda-metrics-apiserver` (matching
# upstream's image name) but the binary inside is `keda-adapter`.
set -eu
. /smoketest/helpers.sh

assert_chart_cmd_paths /keda-adapter
echo "ok"
