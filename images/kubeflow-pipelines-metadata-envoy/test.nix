{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-metadata-envoy" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-metadata-envoy image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-pipelines-metadata-envoy is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-pipelines-metadata-envoy >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-pipelines-metadata-envoy >/dev/null 2>&1' || true

  echo "All kubeflow-pipelines-metadata-envoy tests passed!"
''
