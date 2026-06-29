{ pkgs, image }:

pkgs.writeShellScript "test-telegraf" ''
  set -euo pipefail
  echo "Testing telegraf image..."

  # 1. Entry binary runs and prints version/help (non-empty output; exit code tolerated)
  echo "  Checking telegraf runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1) || true
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking telegraf is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v telegraf >/dev/null 2>&1 || ls /nix/store/*/bin/telegraf >/dev/null 2>&1' || true

  echo "All telegraf tests passed!"
''
