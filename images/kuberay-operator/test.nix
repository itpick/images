{ pkgs, image }:

pkgs.writeShellScript "test-kuberay-operator" ''
  set -euo pipefail
  echo "Testing kuberay-operator image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kuberay-operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kuberay-operator >/dev/null 2>&1 || ls /nix/store/*/bin/kuberay-operator >/dev/null 2>&1'

  echo "All kuberay-operator tests passed!"
''
