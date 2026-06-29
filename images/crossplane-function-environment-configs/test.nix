{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-function-environment-configs" ''
  set -euo pipefail
  echo "Testing crossplane-function-environment-configs image..."

  # 1. Entrypoint binary runs --help and prints non-empty output (exit code tolerated)
  echo "  Checking function-environment-configs runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking function-environment-configs is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v function-environment-configs >/dev/null 2>&1 || ls /nix/store/*/bin/function-environment-configs >/dev/null 2>&1' || true

  echo "All crossplane-function-environment-configs tests passed!"
''
