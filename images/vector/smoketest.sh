#!/bin/sh
# Regression check that the image doesn't hardcode VECTOR_CONFIG (or
# any config-path env vars) -- the helm chart drives config via
# `--config-dir /etc/vector/` and mounts a configmap there. If we
# pre-set VECTOR_CONFIG=/etc/vector/vector.toml at image-config
# level, the binary ignores --config-dir and dies with:
#   ERROR vector::config::loading: Config file not found in path.
#     path="/etc/vector/vector.toml"
set -eu
. /smoketest/helpers.sh

# both expected to be unset
if [ -n "${VECTOR_CONFIG:-}" ]; then
  echo "ASSERT FAIL: VECTOR_CONFIG=${VECTOR_CONFIG} is set in image; chart drives config-dir"
  exit 1
fi
if [ -n "${VECTOR_CONFIG_DIR:-}" ]; then
  echo "ASSERT FAIL: VECTOR_CONFIG_DIR=${VECTOR_CONFIG_DIR} is set in image; chart drives config-dir"
  exit 1
fi

# binary loads
assert_help_runs vector --version

echo "ok"
