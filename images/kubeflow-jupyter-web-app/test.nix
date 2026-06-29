{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-jupyter-web-app" ''
  set -euo pipefail
  echo "Testing kubeflow-jupyter-web-app image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking jupyter-web-app is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v jupyter-web-app >/dev/null 2>&1 || ls /nix/store/*/bin/jupyter-web-app >/dev/null 2>&1'

  echo "All kubeflow-jupyter-web-app tests passed!"
''
