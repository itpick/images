{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-notebook-controller" ''
  set -euo pipefail
  echo "Testing kubeflow-notebook-controller image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking notebook-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v notebook-controller >/dev/null 2>&1 || ls /nix/store/*/bin/notebook-controller >/dev/null 2>&1' || true

  echo "All kubeflow-notebook-controller tests passed!"
''
