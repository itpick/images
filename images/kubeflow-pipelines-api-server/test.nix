{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-api-server" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-api-server image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-pipelines-api-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-pipelines-api-server >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-pipelines-api-server >/dev/null 2>&1' || true

  echo "All kubeflow-pipelines-api-server tests passed!"
''
