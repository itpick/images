{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-katib-suggestion-skopt" ''
  set -euo pipefail
  echo "Testing kubeflow-katib-suggestion-skopt image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-katib-suggestion-skopt is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-katib-suggestion-skopt >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-katib-suggestion-skopt >/dev/null 2>&1'

  echo "All kubeflow-katib-suggestion-skopt tests passed!"
''
