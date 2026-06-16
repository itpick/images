#!/bin/sh
# Regression check for the missing web-vault frontend that crashed
# vaultwarden on startup with:
#   [ERROR] Web vault is not found at 'web-vault/'. To install it...
#   You can also set the environment variable 'WEB_VAULT_ENABLED=false'
# Upstream vaultwarden/server ships the rust binary AND the static
# SPA in one image; nixpkgs splits them, so the default.nix bundles
# pkgs.vaultwarden-webvault and points the binary at it via
# WEB_VAULT_FOLDER. Verify both ends of that wiring.
set -eu
. /smoketest/helpers.sh

# web-vault assets: env var set, directory + index.html bundled
[ -n "${WEB_VAULT_FOLDER:-}" ] || {
  echo "ASSERT FAIL: WEB_VAULT_FOLDER not set in image env"
  exit 1
}
assert_path_exists "$WEB_VAULT_FOLDER" dir
assert_path_exists "$WEB_VAULT_FOLDER/index.html" file

# Rocket bind defaults. Upstream vaultwarden/server sets these in the
# image; we must match or the binary binds to 127.0.0.1 and k8s
# probes / Service traffic can't reach the pod.
[ "${ROCKET_ADDRESS:-}" = "0.0.0.0" ] || {
  echo "ASSERT FAIL: ROCKET_ADDRESS=${ROCKET_ADDRESS:-<unset>}, expected 0.0.0.0"
  exit 1
}
[ "${ROCKET_PROFILE:-}" = "release" ] || {
  echo "ASSERT FAIL: ROCKET_PROFILE=${ROCKET_PROFILE:-<unset>}, expected release"
  exit 1
}

echo "ok"
