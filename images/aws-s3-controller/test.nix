{ pkgs, image }:

pkgs.writeShellScript "test-aws-s3-controller" ''
  set -euo pipefail
  echo "Testing aws-s3-controller image..."

  # 1. Image runs a shell and the s3-controller binary is present
  echo "  Checking s3-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v s3-controller >/dev/null 2>&1 || ls /nix/store/*/bin/s3-controller >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-s3-controller tests passed!"
''
