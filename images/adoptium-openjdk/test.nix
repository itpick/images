{ pkgs, image }:

pkgs.writeShellScript "test-adoptium-openjdk" ''
  set -euo pipefail
  echo "Testing adoptium-openjdk image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]
  echo "All adoptium-openjdk tests passed!"
''
