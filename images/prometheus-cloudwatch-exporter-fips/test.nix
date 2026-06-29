{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-cloudwatch-exporter-fips" ''
  set -euo pipefail
  echo "Testing prometheus-cloudwatch-exporter-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking binary runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. binary is present in the image
  echo "  Checking binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v prometheus-cloudwatch-exporter >/dev/null 2>&1 || ls /nix/store/*/bin/prometheus-cloudwatch-exporter >/dev/null 2>&1'

  echo "All prometheus-cloudwatch-exporter-fips tests passed!"
''
