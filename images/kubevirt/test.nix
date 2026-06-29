{ pkgs, image }:

pkgs.writeShellScript "test-kubevirt" ''
  set -euo pipefail
  echo "Testing kubevirt image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking virtctl runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking virtctl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v virtctl >/dev/null 2>&1 || ls /nix/store/*/bin/virtctl >/dev/null 2>&1'

  echo "All kubevirt tests passed!"
''
