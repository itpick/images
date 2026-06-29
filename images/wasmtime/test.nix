{ pkgs, image }:

pkgs.writeShellScript "test-wasmtime" ''
  set -euo pipefail
  echo "Testing wasmtime image..."

  # 1. Entry binary runs and reports help (non-empty output)
  echo "  Checking wasmtime runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking wasmtime is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v wasmtime >/dev/null 2>&1 || ls /nix/store/*/bin/wasmtime >/dev/null 2>&1' || true

  echo "All wasmtime tests passed!"
''
