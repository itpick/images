#!/bin/sh
# Regression check for the no-Entrypoint bug: nginx charts typically
# leave `command` and `args` unset on the container spec, relying on
# the OCI Entrypoint+Cmd. Without these set, the container fails to
# start with `failed to generate spec: no command specified`.
set -eu
. /smoketest/helpers.sh

# binary on PATH (chart-cmd-paths style check) and version runs
assert_help_runs nginx -v
echo "ok"
