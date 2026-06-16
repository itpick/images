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

# env var was set in the image config
[ -n "${WEB_VAULT_FOLDER:-}" ] || {
  echo "ASSERT FAIL: WEB_VAULT_FOLDER not set in image env"
  exit 1
}

# the directory it points at landed in the rootfs
assert_path_exists "$WEB_VAULT_FOLDER" dir

# and contains the SPA entry point the binary actually serves
assert_path_exists "$WEB_VAULT_FOLDER/index.html" file

echo "ok"
