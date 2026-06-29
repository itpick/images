{ pkgs, image }:

pkgs.writeShellScript "test-rancher-hardened-kubernetes-compat-fips" ''
  set -euo pipefail
  echo "Testing rancher-hardened-kubernetes-compat-fips image..."

  # 1. Image runs a shell (exits 0)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking rancher-hardened-kubernetes-compat binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rancher-hardened-kubernetes-compat >/dev/null 2>&1 || ls /nix/store/*/bin/rancher-hardened-kubernetes-compat >/dev/null 2>&1'

  echo "All rancher-hardened-kubernetes-compat-fips tests passed!"
''
