{ pkgs, image }:

pkgs.writeShellScript "test-benthos" ''
  set -euo pipefail
  echo "Testing benthos image..."

  # 1. Entry binary runs and reports version (exit 0, non-empty output).
  #    The image cmd runs a stream; override with --version so the test does not block.
  echo "  Checking benthos runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking benthos is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v benthos >/dev/null 2>&1 || ls /nix/store/*/bin/benthos >/dev/null 2>&1'

  echo "All benthos tests passed!"
''
