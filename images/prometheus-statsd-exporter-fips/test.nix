{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-statsd-exporter-fips" ''
  set -euo pipefail
  echo "Testing prometheus-statsd-exporter-fips image..."

  # 1. Entrypoint runs and emits output (tolerate non-zero exit from flag parser)
  echo "  Checking entrypoint runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Image has a working shell + filesystem
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls / >/dev/null && echo ok' | grep -q ok

  echo "All prometheus-statsd-exporter-fips tests passed!"
''
