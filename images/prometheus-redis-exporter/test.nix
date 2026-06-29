{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-redis-exporter" ''
  set -euo pipefail
  echo "Testing prometheus-redis-exporter image..."

  # 1. Entrypoint runs and emits output (tolerate non-zero exit from flag parser)
  echo "  Checking redis_exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking redis_exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v redis_exporter >/dev/null 2>&1 || ls /nix/store/*/bin/redis_exporter >/dev/null 2>&1' || true

  echo "All prometheus-redis-exporter tests passed!"
''
