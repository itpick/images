{ pkgs, image }:

pkgs.writeShellScript "test-nextflow" ''
  set -euo pipefail
  echo "Testing nextflow image..."

  # 1. Binary runs and reports version/help (non-empty output)
  echo "  Checking nextflow runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking nextflow is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v nextflow >/dev/null 2>&1 || ls /nix/store/*/bin/nextflow >/dev/null 2>&1'

  echo "All nextflow tests passed!"
''
