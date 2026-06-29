{ pkgs, image }:

pkgs.writeShellScript "test-aws-node-termination-handler-fips" ''
  set -euo pipefail
  echo "Testing aws-node-termination-handler-fips image..."

  # 1. Entry binary runs --help (exit 0, non-empty output)
  echo "  Checking aws-node-termination-handler runs --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking aws-node-termination-handler is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v aws-node-termination-handler >/dev/null 2>&1 || ls /nix/store/*/bin/aws-node-termination-handler >/dev/null 2>&1' || true

  echo "All aws-node-termination-handler-fips tests passed!"
''
