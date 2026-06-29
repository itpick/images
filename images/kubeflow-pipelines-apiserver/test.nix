{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-apiserver" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-apiserver image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking pipelines-apiserver is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-apiserver >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-apiserver >/dev/null 2>&1'

  echo "All kubeflow-pipelines-apiserver tests passed!"
''
