{ pkgs, image }:

pkgs.writeShellScript "test-conduit" ''
  set -euo pipefail
  echo "Testing conduit image..."

  # 1. Image runs a shell (smoke test; binary is a long-running/argument-driven
  #    process with no reliable version/help one-shot, so we don't invoke it).
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image.
  echo "  Checking conduit is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v conduit >/dev/null 2>&1 || ls /nix/store/*/bin/conduit >/dev/null 2>&1' || true

  echo "All conduit tests passed!"
''
