#!/bin/sh
# The dragonfly helm chart wires liveness + readiness probes to
# exec /usr/local/bin/healthcheck.sh. Without the script the pod is
# never Ready and gets killed by liveness:
#   /bin/sh: can't open '/usr/local/bin/healthcheck.sh': No such file
set -eu
. /smoketest/helpers.sh

assert_chart_cmd_paths /usr/local/bin/healthcheck.sh
echo "ok"
