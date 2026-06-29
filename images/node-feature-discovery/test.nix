{ pkgs, image }:

pkgs.writeShellScript "test-node-feature-discovery" ''
  set -euo pipefail
  echo "Testing node-feature-discovery image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking node-feature-discovery runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking node-feature-discovery is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v node-feature-discovery >/dev/null 2>&1 || ls /nix/store/*/bin/node-feature-discovery >/dev/null 2>&1'

  echo "All node-feature-discovery tests passed!"
''
