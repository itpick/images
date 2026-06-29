{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-statsd-exporter" ''
  set -euo pipefail
  echo "Testing prometheus-statsd-exporter image..."

  # 1. Entrypoint runs and emits output
  echo "  Checking statsd_exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking statsd_exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v statsd_exporter >/dev/null 2>&1 || ls /nix/store/*/bin/statsd_exporter >/dev/null 2>&1'

  echo "All prometheus-statsd-exporter tests passed!"
''
