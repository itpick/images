{ pkgs, image }:

pkgs.writeShellScript "test-grpcurl" ''
  set -euo pipefail
  echo "Testing grpcurl image..."

  # grpcurl runs and prints help/usage (non-empty output)
  echo "  Checking grpcurl runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking grpcurl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v grpcurl >/dev/null 2>&1 || ls /nix/store/*/bin/grpcurl >/dev/null 2>&1'

  echo "All grpcurl tests passed!"
''
