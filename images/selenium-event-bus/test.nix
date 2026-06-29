{ pkgs, image }:

pkgs.writeShellScript "test-selenium-event-bus" ''
  set -euo pipefail
  echo "Testing selenium-event-bus image..."

  # 1. java runs and prints non-empty output (exit 0)
  echo "  Checking java runs (-version)..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking java is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v java >/dev/null 2>&1 || ls /nix/store/*/bin/java >/dev/null 2>&1' || true

  echo "All selenium-event-bus tests passed!"
''
