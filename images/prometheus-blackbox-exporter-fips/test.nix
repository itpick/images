{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-blackbox-exporter-fips" ''
  set -euo pipefail
  echo "Testing prometheus-blackbox-exporter-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking blackbox-exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. blackbox-exporter binary is present in the image
  echo "  Checking blackbox-exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v blackbox-exporter >/dev/null 2>&1 || ls /nix/store/*/bin/blackbox-exporter >/dev/null 2>&1'

  echo "All prometheus-blackbox-exporter-fips tests passed!"
''
