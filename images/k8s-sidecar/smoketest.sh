#!/usr/bin/env bash
# Regression check for the missing python deps that crashed grafana
# sidecar on startup with:
#   ModuleNotFoundError: No module named 'logfmter'
# k8s-sidecar 2.7.x added python-json-logger + logfmter to its
# requirements; default.nix's python.withPackages list was stale.
set -euo pipefail
. /smoketest/helpers.sh

assert_python_imports logfmter pythonjsonlogger kubernetes requests
echo "ok"
