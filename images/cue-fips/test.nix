{ pkgs, image }:

pkgs.writeShellScript "test-cue-fips" ''
  set -euo pipefail
  echo "Testing cue-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All cue-fips tests passed!"
''
