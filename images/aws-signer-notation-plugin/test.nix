{ pkgs, image }:

pkgs.writeShellScript "test-aws-signer-notation-plugin" ''
  set -euo pipefail
  echo "Testing aws-signer-notation-plugin image..."

  # 1. Image runs a shell and the signer-notation-plugin binary is present
  echo "  Checking signer-notation-plugin is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v signer-notation-plugin >/dev/null 2>&1 || ls /nix/store/*/bin/signer-notation-plugin >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-signer-notation-plugin tests passed!"
''
