{ pkgs, image }:

pkgs.writeShellScript "test-amazon-vpc-cni" ''
  set -euo pipefail
  echo "Testing amazon-vpc-cni image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # CNI binary present
  echo "  Checking aws-cni is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-cni >/dev/null 2>&1 || ls /nix/store/*/bin/aws-cni >/dev/null 2>&1'

  echo "All amazon-vpc-cni tests passed!"
''
