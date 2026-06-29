{ pkgs, image }:

pkgs.writeShellScript "test-vim" ''
  set -euo pipefail
  echo "Testing vim image..."

  # 1. Entry binary runs and reports help (non-empty output)
  echo "  Checking vim runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vim is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vim >/dev/null 2>&1 || ls /nix/store/*/bin/vim >/dev/null 2>&1'

  echo "All vim tests passed!"
''
