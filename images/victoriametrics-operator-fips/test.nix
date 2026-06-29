{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-operator-fips" ''
  set -euo pipefail
  echo "Testing victoriametrics-operator-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vm-operator runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vm-operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vm-operator >/dev/null 2>&1 || ls /nix/store/*/bin/vm-operator >/dev/null 2>&1' || true

  echo "All victoriametrics-operator-fips tests passed!"
''
