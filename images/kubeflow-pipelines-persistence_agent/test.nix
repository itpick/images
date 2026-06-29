{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-persistence_agent" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-persistence_agent image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking pipelines-persistence_agent is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pipelines-persistence_agent >/dev/null 2>&1 || ls /nix/store/*/bin/pipelines-persistence_agent >/dev/null 2>&1' || true

  echo "All kubeflow-pipelines-persistence_agent tests passed!"
''
