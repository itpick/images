#!/bin/sh
# Regression check: this image MUST be a v4-line zitadel binary, not
# the v2.71.7 we'd get if we naively used nixpkgs.zitadel. v4 was a
# breaking API redesign -- the v4 zitadel-login UI talks v4 gRPC
# endpoints that v2 backends return UNIMPLEMENTED for, so silently
# regressing to v2 takes SSO down on any v4-era cluster (we hit this
# on dev once already -- see grail-config PR #598).
set -eu
. /smoketest/helpers.sh

# binary loads
out=$(zitadel --version 2>&1)
echo "$out"
case "$out" in
  *"version v4."*) : ;;
  *)
    echo "ASSERT FAIL: expected zitadel v4.x line; got: $out"
    exit 1
    ;;
esac

echo "ok"
