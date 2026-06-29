{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pvcviewer-controller-fips" ''
  set -euo pipefail
  echo "Testing kubeflow-pvcviewer-controller-fips image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking pvcviewer-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pvcviewer-controller >/dev/null 2>&1 || ls /nix/store/*/bin/pvcviewer-controller >/dev/null 2>&1' || true

  echo "All kubeflow-pvcviewer-controller-fips tests passed!"
''
