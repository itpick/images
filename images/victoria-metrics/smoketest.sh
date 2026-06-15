#!/usr/bin/env bash
# Same drop-in compat reason as ../victoria-logs/smoketest.sh — upstream
# runs as root, so existing PVCs were initialized root-owned. mkImage's
# default non-root user broke flock acquisition with:
#   FATAL: cannot create lock file "/<storageDataPath>/flock.lock":
#          permission denied
set -euo pipefail
. /smoketest/helpers.sh

assert_user "0:0"
echo "ok"
