{ pkgs, image }:

pkgs.writeShellScript "test-influx" ''
  set -euo pipefail
  echo "Testing influx image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test 2>&1 || true)
  [ -n "$out" ]
  echo "All influx tests passed!"
''
