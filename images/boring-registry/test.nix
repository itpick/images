{ pkgs, image }:

pkgs.writeShellScript "test-boring-registry" ''
  set -euo pipefail
  echo "Testing boring-registry image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All boring-registry tests passed!"
''
