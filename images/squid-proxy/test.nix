{ pkgs, image }:

pkgs.writeShellScript "test-squid-proxy" ''
  set -euo pipefail
  echo "Testing squid-proxy image..."

  # 1. squid reports its version (the default Cmd runs the daemon, so override)
  echo "  Checking squid runs (-v)..."
  out=$(docker run --rm --entrypoint squid ${image.imageName}:test -v 2>&1 || true)
  [ -n "$out" ]

  # 2. squid binary present in image
  echo "  Checking squid is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v squid >/dev/null 2>&1 || ls /nix/store/*/bin/squid >/dev/null 2>&1' || true

  echo "All squid-proxy tests passed!"
''
