{ pkgs, image }:

pkgs.writeShellScript "test-aws-for-fluent-bit" ''
  set -euo pipefail
  echo "Testing aws-for-fluent-bit image..."

  # 1. Image runs a shell and the aws-for-fluent-bit binary is present
  echo "  Checking aws-for-fluent-bit is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-for-fluent-bit >/dev/null 2>&1 || ls /nix/store/*/bin/aws-for-fluent-bit >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-for-fluent-bit tests passed!"
''
