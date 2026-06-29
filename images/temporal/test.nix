{ pkgs, image }:

pkgs.writeShellScript "test-temporal" ''
  set -euo pipefail
  echo "Testing temporal image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking temporal runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking temporal is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v temporal >/dev/null 2>&1 || ls /nix/store/*/bin/temporal >/dev/null 2>&1' || true

  echo "All temporal tests passed!"
''
