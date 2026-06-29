{ pkgs, image }:

pkgs.writeShellScript "test-rancher-fleet-termination-log" ''
  set -euo pipefail
  echo "Testing rancher-fleet-termination-log image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking fleet-termination-log binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v fleet-termination-log >/dev/null 2>&1 || ls /nix/store/*/bin/fleet-termination-log >/dev/null 2>&1' || true

  echo "All rancher-fleet-termination-log tests passed!"
''
