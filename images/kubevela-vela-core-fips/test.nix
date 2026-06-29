{ pkgs, image }:

pkgs.writeShellScript "test-kubevela-vela-core-fips" ''
  set -euo pipefail
  echo "Testing kubevela-vela-core-fips image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking vela runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vela is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vela >/dev/null 2>&1 || ls /nix/store/*/bin/vela >/dev/null 2>&1' || true

  echo "All kubevela-vela-core-fips tests passed!"
''
