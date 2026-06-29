{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-jupyter-web-app-fips" ''
  set -euo pipefail
  echo "Testing kubeflow-jupyter-web-app-fips image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubeflow-jupyter-web-app is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubeflow-jupyter-web-app >/dev/null 2>&1 || ls /nix/store/*/bin/kubeflow-jupyter-web-app >/dev/null 2>&1'

  echo "All kubeflow-jupyter-web-app-fips tests passed!"
''
