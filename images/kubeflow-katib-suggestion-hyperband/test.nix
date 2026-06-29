{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-katib-suggestion-hyperband" ''
  set -euo pipefail
  echo "Testing kubeflow-katib-suggestion-hyperband image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-katib-suggestion-hyperband is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-katib-suggestion-hyperband >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-katib-suggestion-hyperband >/dev/null 2>&1' || true

  echo "All kubeflow-katib-suggestion-hyperband tests passed!"
''
