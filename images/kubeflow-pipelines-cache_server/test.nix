{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-cache_server" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-cache_server image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking pipelines-cache_server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-cache_server >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-cache_server >/dev/null 2>&1'

  echo "All kubeflow-pipelines-cache_server tests passed!"
''
