{ pkgs, image }:

pkgs.writeShellScript "test-kubevela-vela-cli" ''
  set -euo pipefail
  echo "Testing kubevela-vela-cli image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking vela runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vela is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vela >/dev/null 2>&1 || ls /nix/store/*/bin/vela >/dev/null 2>&1'

  echo "All kubevela-vela-cli tests passed!"
''
