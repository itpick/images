{ pkgs, image }:

pkgs.writeShellScript "test-nano" ''
  set -euo pipefail
  echo "Testing nano image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking nano runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nano is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nano >/dev/null 2>&1 || ls /nix/store/*/bin/nano >/dev/null 2>&1'

  echo "All nano tests passed!"
''
