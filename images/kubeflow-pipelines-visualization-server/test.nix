{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-visualization-server" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-visualization-server image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking pipelines-visualization-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-visualization-server >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-visualization-server >/dev/null 2>&1'

  echo "All kubeflow-pipelines-visualization-server tests passed!"
''
