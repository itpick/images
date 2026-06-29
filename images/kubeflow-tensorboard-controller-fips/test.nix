{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-tensorboard-controller-fips" ''
  set -euo pipefail
  echo "Testing kubeflow-tensorboard-controller-fips image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking tensorboard-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tensorboard-controller >/dev/null 2>&1 || ls /nix/store/*/bin/tensorboard-controller >/dev/null 2>&1'

  echo "All kubeflow-tensorboard-controller-fips tests passed!"
''
