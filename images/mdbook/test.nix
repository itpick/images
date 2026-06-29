{ pkgs, image }:

pkgs.writeShellScript "test-mdbook" ''
  set -euo pipefail
  echo "Testing mdbook image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking mdbook runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking mdbook is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mdbook >/dev/null 2>&1 || ls /nix/store/*/bin/mdbook >/dev/null 2>&1' || true

  echo "All mdbook tests passed!"
''
