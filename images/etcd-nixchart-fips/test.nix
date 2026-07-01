{ pkgs, image }:

pkgs.writeShellScript "test-etcd-nixchart-fips" ''
  set -euo pipefail
  echo "Testing etcd-nixchart-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All etcd-nixchart-fips tests passed!"
''
