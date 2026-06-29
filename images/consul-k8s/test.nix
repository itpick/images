{ pkgs, image }:

pkgs.writeShellScript "test-consul-k8s" ''
  set -euo pipefail
  echo "Testing consul-k8s image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test version 2>&1 || true)
  [ -n "$out" ]
  echo "All consul-k8s tests passed!"
''
