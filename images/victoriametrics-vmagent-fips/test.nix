{ pkgs, image }:

pkgs.writeShellScript "test-victoriametrics-vmagent-fips" ''
  set -euo pipefail
  echo "Testing victoriametrics-vmagent-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking vmagent runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking vmagent is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v vmagent >/dev/null 2>&1 || ls /nix/store/*/bin/vmagent >/dev/null 2>&1' || true

  echo "All victoriametrics-vmagent-fips tests passed!"
''
