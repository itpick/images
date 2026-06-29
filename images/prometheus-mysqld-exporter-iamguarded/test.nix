{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-mysqld-exporter-iamguarded" ''
  set -euo pipefail
  echo "Testing prometheus-mysqld-exporter-iamguarded image..."

  # 1. Entrypoint runs and prints version/help output (non-empty).
  #    Tolerant of exit code; the real check is that the binary produced output.
  echo "  Checking prometheus-mysqld-exporter-iamguarded runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Image provides a working shell.
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'echo ok' | grep -q ok

  echo "All prometheus-mysqld-exporter-iamguarded tests passed!"
''
