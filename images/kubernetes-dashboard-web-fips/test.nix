{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-dashboard-web-fips" ''
  set -euo pipefail
  echo "Testing kubernetes-dashboard-web-fips image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking dashboard-web runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking dashboard-web is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dashboard-web >/dev/null 2>&1 || ls /nix/store/*/bin/dashboard-web >/dev/null 2>&1'

  echo "All kubernetes-dashboard-web-fips tests passed!"
''
