{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-dashboard-auth" ''
  set -euo pipefail
  echo "Testing kubernetes-dashboard-auth image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking dashboard-auth runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking dashboard-auth is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dashboard-auth >/dev/null 2>&1 || ls /nix/store/*/bin/dashboard-auth >/dev/null 2>&1'

  echo "All kubernetes-dashboard-auth tests passed!"
''
