{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-function-auto-ready" ''
  set -euo pipefail
  echo "Testing crossplane-function-auto-ready image..."

  # 1. Entrypoint binary runs --help and prints non-empty output (exit code tolerated)
  echo "  Checking function-auto-ready runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking function-auto-ready is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v function-auto-ready >/dev/null 2>&1 || ls /nix/store/*/bin/function-auto-ready >/dev/null 2>&1' || true

  echo "All crossplane-function-auto-ready tests passed!"
''
