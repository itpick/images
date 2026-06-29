{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-metadata-writer" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-metadata-writer image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking pipelines-metadata-writer is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-metadata-writer >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-metadata-writer >/dev/null 2>&1'

  echo "All kubeflow-pipelines-metadata-writer tests passed!"
''
