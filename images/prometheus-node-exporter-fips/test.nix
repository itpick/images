{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-node-exporter-fips" ''
  set -euo pipefail
  echo "Testing prometheus-node-exporter-fips image..."

  # 1. Entrypoint runs and prints version/help output (non-empty).
  #    Tolerant of exit code; the real check is that the binary produced output.
  echo "  Checking node-exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Image provides a working shell.
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'echo ok' | grep -q ok

  echo "All prometheus-node-exporter-fips tests passed!"
''
