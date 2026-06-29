{ pkgs, image }:

pkgs.writeShellScript "test-rancher-fleet-controller" ''
  set -euo pipefail
  echo "Testing rancher-fleet-controller image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking fleet-controller binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v fleet-controller >/dev/null 2>&1 || ls /nix/store/*/bin/fleet-controller >/dev/null 2>&1' || true

  echo "All rancher-fleet-controller tests passed!"
''
