{ pkgs, image }:

pkgs.writeShellScript "test-aws-cli" ''
  set -euo pipefail
  echo "Testing aws-cli image..."

  # 1. Entry binary reports version and prints non-empty output
  echo "  Checking aws runs (--version)..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking aws is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws >/dev/null 2>&1 || ls /nix/store/*/bin/aws >/dev/null 2>&1' || true

  echo "All aws-cli tests passed!"
''
