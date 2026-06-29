{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-katib-file-metrics-collector" ''
  set -euo pipefail
  echo "Testing kubeflow-katib-file-metrics-collector image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-katib-file-metrics-collector is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-katib-file-metrics-collector >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-katib-file-metrics-collector >/dev/null 2>&1'

  echo "All kubeflow-katib-file-metrics-collector tests passed!"
''
