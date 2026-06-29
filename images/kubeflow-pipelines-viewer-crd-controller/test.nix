{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-pipelines-viewer-crd-controller" ''
  set -euo pipefail
  echo "Testing kubeflow-pipelines-viewer-crd-controller image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-pipelines-viewer-crd-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-pipelines-viewer-crd-controller >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-pipelines-viewer-crd-controller >/dev/null 2>&1'

  echo "All kubeflow-pipelines-viewer-crd-controller tests passed!"
''
