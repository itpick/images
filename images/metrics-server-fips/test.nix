{ pkgs, image }:

pkgs.writeShellScript "test-metrics-server-fips" ''
  set -euo pipefail
  echo "Testing metrics-server-fips image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking metrics-server runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking metrics-server is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v metrics-server >/dev/null 2>&1 || ls /nix/store/*/bin/metrics-server >/dev/null 2>&1'

  echo "All metrics-server-fips tests passed!"
''
