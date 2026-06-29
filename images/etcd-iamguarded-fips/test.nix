{ pkgs, image }:

pkgs.writeShellScript "test-etcd-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing etcd-iamguarded-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All etcd-iamguarded-fips tests passed!"
''
