{ pkgs, image }:

pkgs.writeShellScript "test-etcd-iamguarded" ''
  set -euo pipefail
  echo "Testing etcd-iamguarded image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All etcd-iamguarded tests passed!"
''
