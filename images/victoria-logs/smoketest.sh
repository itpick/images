#!/bin/sh
# Drop-in compat with the upstream victoriametrics/victoria-logs image,
# which runs as root and writes root-owned flock.lock + storage dirs.
# Reverting to mkImage's default non-root user broke the chart against
# existing PVCs with:
#   FATAL: cannot create lock file "/victoria-logs-data/flock.lock":
#          permission denied
set -eu
. /smoketest/helpers.sh

assert_user "0:0"
echo "ok"
