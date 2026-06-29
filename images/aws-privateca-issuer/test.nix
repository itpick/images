{ pkgs, image }:

pkgs.writeShellScript "test-aws-privateca-issuer" ''
  set -euo pipefail
  echo "Testing aws-privateca-issuer image..."

  # 1. Image runs a shell and the privateca-issuer binary is present
  echo "  Checking privateca-issuer is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v privateca-issuer >/dev/null 2>&1 || ls /nix/store/*/bin/privateca-issuer >/dev/null 2>&1'

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-privateca-issuer tests passed!"
''
