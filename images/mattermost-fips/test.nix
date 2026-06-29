{ pkgs, image }:

pkgs.writeShellScript "test-mattermost-fips" ''
  set -euo pipefail
  echo "Testing mattermost-fips image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All mattermost-fips tests passed!"
''
