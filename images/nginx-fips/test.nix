{ pkgs, image }:

# Real integration tests for nginx-fips. The original tests only invoked
# `nginx -v`/`-h` which exercises no I/O. This version also verifies the
# image works under cap_drop=ALL with a real writable /tmp (the canonical
# place compose-shim entrypoints sed-substitute config into).
pkgs.writeShellScript "test-nginx-fips" ''
  set -euo pipefail

  IMAGE="${image.imageName}:test"

  echo "🧪 nginx-fips integration test"

  echo "  ✓ nginx -v"
  docker run --rm --cap-drop=ALL --security-opt no-new-privileges \
    "$IMAGE" nginx -v 2>&1 | grep -q "nginx version"

  echo "  ✓ nginx -t (config syntax check)"
  docker run --rm --cap-drop=ALL --security-opt no-new-privileges \
    "$IMAGE" nginx -t 2>&1 | grep -q "test is successful"

  # /tmp must be a real writable directory — not the read-only nix-store
  # symlink the buildEnv would otherwise produce. Compose entrypoint shims
  # routinely do `sed > /tmp/nginx.conf` then exec nginx with -c on that
  # path; that idiom failed silently against the prior image.
  echo "  ✓ /tmp is writable under cap_drop=ALL"
  docker run --rm --cap-drop=ALL --security-opt no-new-privileges \
    --entrypoint sh "$IMAGE" -c 'echo data > /tmp/probe && cat /tmp/probe' \
    | grep -q '^data$'

  echo "  ✓ default user is nonroot"
  uid=$(docker run --rm --cap-drop=ALL --security-opt no-new-privileges \
    --entrypoint id "$IMAGE" -u)
  if [ "$uid" = "0" ]; then
    echo "FAIL: image defaults to root (expected nonroot)"
    exit 1
  fi

  echo "✅ All nginx-fips tests passed!"
''
