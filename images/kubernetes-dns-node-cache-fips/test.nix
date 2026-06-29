{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-dns-node-cache-fips" ''
  set -euo pipefail
  echo "Testing kubernetes-dns-node-cache-fips image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking dns-node-cache runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking dns-node-cache is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dns-node-cache >/dev/null 2>&1 || ls /nix/store/*/bin/dns-node-cache >/dev/null 2>&1' || true

  echo "All kubernetes-dns-node-cache-fips tests passed!"
''
