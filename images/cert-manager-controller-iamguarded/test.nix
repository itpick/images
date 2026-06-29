{ pkgs, image }:

pkgs.writeShellScript "test-cert-manager-controller-iamguarded" ''
  set -euo pipefail
  echo "Testing cert-manager-controller-iamguarded image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All cert-manager-controller-iamguarded tests passed!"
''
