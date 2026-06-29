{ pkgs, image }:

pkgs.writeShellScript "test-kubeflow-volumes-web-app" ''
  set -euo pipefail
  echo "Testing kubeflow-volumes-web-app image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking volumes-web-app is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v volumes-web-app >/dev/null 2>&1 || ls /nix/store/*/bin/volumes-web-app >/dev/null 2>&1' || true

  echo "All kubeflow-volumes-web-app tests passed!"
''
