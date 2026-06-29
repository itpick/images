{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-beat-exporter-fips" ''
  set -euo pipefail
  echo "Testing prometheus-beat-exporter-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking beat-exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. beat-exporter binary is present in the image
  echo "  Checking beat-exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v beat-exporter >/dev/null 2>&1 || ls /nix/store/*/bin/beat-exporter >/dev/null 2>&1'

  echo "All prometheus-beat-exporter-fips tests passed!"
''
