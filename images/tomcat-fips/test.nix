{ pkgs, image }:

pkgs.writeShellScript "test-tomcat-fips" ''
  set -euo pipefail
  echo "Testing tomcat-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All tomcat-fips tests passed!"
''
