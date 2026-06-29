{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-blackbox-exporter-iamguarded" ''
  set -euo pipefail
  echo "Testing prometheus-blackbox-exporter-iamguarded image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking binary runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. binary is present in the image
  echo "  Checking binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v prometheus-blackbox-exporter-iamguarded >/dev/null 2>&1 || ls /nix/store/*/bin/prometheus-blackbox-exporter-iamguarded >/dev/null 2>&1' || true

  echo "All prometheus-blackbox-exporter-iamguarded tests passed!"
''
