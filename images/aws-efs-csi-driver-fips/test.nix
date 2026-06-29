{ pkgs, image }:

pkgs.writeShellScript "test-aws-efs-csi-driver-fips" ''
  set -euo pipefail
  echo "Testing aws-efs-csi-driver-fips image..."

  # 1. Image runs a shell and the aws-efs-csi-driver binary is present
  echo "  Checking aws-efs-csi-driver is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-efs-csi-driver >/dev/null 2>&1 || ls /nix/store/*/bin/aws-efs-csi-driver >/dev/null 2>&1'

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-efs-csi-driver-fips tests passed!"
''
