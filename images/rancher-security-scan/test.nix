{ pkgs, image }:

pkgs.writeShellScript "test-rancher-security-scan" ''
  set -euo pipefail
  echo "Testing rancher-security-scan image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking security-scan binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v security-scan >/dev/null 2>&1 || ls /nix/store/*/bin/security-scan >/dev/null 2>&1'

  echo "All rancher-security-scan tests passed!"
''
