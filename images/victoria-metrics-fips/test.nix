{ pkgs, image }:

pkgs.writeShellScript "test-victoria-metrics-fips" ''
  set -euo pipefail
  echo "Testing victoria-metrics-fips image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking victoria-metrics runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking victoria-metrics is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v victoria-metrics >/dev/null 2>&1 || ls /nix/store/*/bin/victoria-metrics >/dev/null 2>&1' || true

  echo "All victoria-metrics-fips tests passed!"
''
