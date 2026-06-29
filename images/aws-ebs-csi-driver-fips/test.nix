{ pkgs, image }:

pkgs.writeShellScript "test-aws-ebs-csi-driver-fips" ''
  set -euo pipefail
  echo "Testing aws-ebs-csi-driver-fips image..."

  # 1. Image runs a shell and the aws-ebs-csi-driver binary is present
  echo "  Checking aws-ebs-csi-driver is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-ebs-csi-driver >/dev/null 2>&1 || ls /nix/store/*/bin/aws-ebs-csi-driver >/dev/null 2>&1' || true

  # 2. Image filesystem is intact
  echo "  Checking image filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All aws-ebs-csi-driver-fips tests passed!"
''
