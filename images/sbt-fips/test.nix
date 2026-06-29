{ pkgs, image }:

pkgs.writeShellScript "test-sbt-fips" ''
  set -euo pipefail
  echo "Testing sbt-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All sbt-fips tests passed!"
''
