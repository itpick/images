{ pkgs, image }:

pkgs.writeShellScript "test-kube-vip-cloud-provider" ''
  set -euo pipefail
  echo "Testing kube-vip-cloud-provider image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking vip-cloud-provider is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vip-cloud-provider >/dev/null 2>&1 || ls /nix/store/*/bin/vip-cloud-provider >/dev/null 2>&1'

  echo "All kube-vip-cloud-provider tests passed!"
''
