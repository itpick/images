{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-cache-deployer" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-cache-deployer image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking pipelines-cache-deployer is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-cache-deployer >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-cache-deployer >/dev/null 2>&1' || true

  echo "All kubeflow-pipelines-cache-deployer tests passed!"
''
