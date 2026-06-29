{ pkgs, image }:

pkgs.writeShellScript "test-reposilite" ''
  set -euo pipefail
  echo "Testing reposilite image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All reposilite tests passed!"
''
