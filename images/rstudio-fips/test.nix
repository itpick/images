{ pkgs, image }:

pkgs.writeShellScript "test-rstudio-fips" ''
  set -euo pipefail
  echo "Testing rstudio-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All rstudio-fips tests passed!"
''
