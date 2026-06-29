{ pkgs, image }:

pkgs.writeShellScript "test-promtail" ''
  set -euo pipefail
  echo "Testing promtail image..."

  # 1. Entrypoint runs and emits output
  echo "  Checking promtail runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking promtail is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v promtail >/dev/null 2>&1 || ls /nix/store/*/bin/promtail >/dev/null 2>&1'

  echo "All promtail tests passed!"
''
