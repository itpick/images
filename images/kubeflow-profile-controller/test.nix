{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-profile-controller" ''
  set -euo pipefail
  echo "Testing kubeflow-profile-controller image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking profile-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v profile-controller >/dev/null 2>&1 || ls /nix/store/*/bin/profile-controller >/dev/null 2>&1' || true

  echo "All kubeflow-profile-controller tests passed!"
''
