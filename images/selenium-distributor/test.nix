{ pkgs, image }:

pkgs.writeShellScript "test-selenium-distributor" ''
  set -euo pipefail
  echo "Testing selenium-distributor image..."

  # 1. java runs and prints non-empty output (exit 0)
  echo "  Checking java runs (-version)..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking java is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v java >/dev/null 2>&1 || ls /nix/store/*/bin/java >/dev/null 2>&1'

  echo "All selenium-distributor tests passed!"
''
