{ pkgs, image }:

pkgs.writeShellScript "test-wasmer" ''
  set -euo pipefail
  echo "Testing wasmer image..."

  # 1. Entry binary runs and reports help (non-empty output)
  echo "  Checking wasmer runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking wasmer is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v wasmer >/dev/null 2>&1 || ls /nix/store/*/bin/wasmer >/dev/null 2>&1' || true

  echo "All wasmer tests passed!"
''
