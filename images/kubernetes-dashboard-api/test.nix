{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-dashboard-api" ''
  set -euo pipefail
  echo "Testing kubernetes-dashboard-api image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking dashboard-api runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking dashboard-api is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dashboard-api >/dev/null 2>&1 || ls /nix/store/*/bin/dashboard-api >/dev/null 2>&1'

  echo "All kubernetes-dashboard-api tests passed!"
''
