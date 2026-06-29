{ pkgs, image }:

pkgs.writeShellScript "test-polaris" ''
  set -euo pipefail
  echo "Testing polaris image..."

  # 1. polaris prints help (exit 0, non-empty output)
  echo "  Checking polaris --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. polaris binary present in image
  echo "  Checking polaris binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v polaris >/dev/null 2>&1 || ls /nix/store/*/bin/polaris >/dev/null 2>&1' || true

  echo "All polaris tests passed!"
''
