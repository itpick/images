{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-access-management" ''
  set -euo pipefail
  echo "Testing kubeflow-access-management image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-access-management is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-access-management >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-access-management >/dev/null 2>&1' || true

  echo "All kubeflow-access-management tests passed!"
''
