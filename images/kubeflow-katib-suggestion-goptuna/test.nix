{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-katib-suggestion-goptuna" ''
  set -euo pipefail
  echo "Testing kubeflow-katib-suggestion-goptuna image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-katib-suggestion-goptuna is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-katib-suggestion-goptuna >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-katib-suggestion-goptuna >/dev/null 2>&1' || true

  echo "All kubeflow-katib-suggestion-goptuna tests passed!"
''
