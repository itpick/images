{ pkgs, image }:

pkgs.writeShellScript "test-cert-manager-webhook-pdns" ''
  set -euo pipefail
  echo "Testing cert-manager-webhook-pdns image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All cert-manager-webhook-pdns tests passed!"
''
