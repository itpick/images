#!/bin/sh
# Regression check for the missing python deps that crashed grafana
# sidecar on startup with:
#   ModuleNotFoundError: No module named 'logfmter'
# k8s-sidecar 2.7.x added python-json-logger + logfmter to its
# requirements; default.nix's python.withPackages list was stale.
#
# The image's only /bin entry is the `sidecar` wrapper script, not a
# bare `python3`. Extract the interpreter from the wrapper's shebang
# so we can run an import-only smoke without launching the full
# watcher process.
set -eu
. /smoketest/helpers.sh

PY=$(head -1 /bin/sidecar | sed 's|^#!||')
"$PY" -c "import logfmter; import pythonjsonlogger; import kubernetes; import requests"
echo "ok"
