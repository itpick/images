{ pkgs, image }:

pkgs.writeShellScript "test-cert-manager-cainjector-iamguarded" ''
  set -euo pipefail
  echo "Testing cert-manager-cainjector-iamguarded image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All cert-manager-cainjector-iamguarded tests passed!"
''
