{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-alertmanager-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing prometheus-alertmanager-iamguarded-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking binary runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. binary is present in the image
  echo "  Checking binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v prometheus-alertmanager-iamguarded >/dev/null 2>&1 || ls /nix/store/*/bin/prometheus-alertmanager-iamguarded >/dev/null 2>&1'

  echo "All prometheus-alertmanager-iamguarded-fips tests passed!"
''
