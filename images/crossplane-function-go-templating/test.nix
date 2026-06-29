{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-function-go-templating" ''
  set -euo pipefail
  echo "Testing crossplane-function-go-templating image..."

  # 1. Entrypoint binary runs --help and prints non-empty output (exit code tolerated)
  echo "  Checking function-go-templating runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking function-go-templating is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v function-go-templating >/dev/null 2>&1 || ls /nix/store/*/bin/function-go-templating >/dev/null 2>&1'

  echo "All crossplane-function-go-templating tests passed!"
''
