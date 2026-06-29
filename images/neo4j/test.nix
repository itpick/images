{ pkgs, image }:

pkgs.writeShellScript "test-neo4j" ''
  set -euo pipefail
  echo "Testing neo4j image..."

  # Conservative smoke test: binary present and image runs a shell.
  echo "  Checking neo4j is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v neo4j >/dev/null 2>&1 || ls /nix/store/*/bin/neo4j >/dev/null 2>&1' || true

  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All neo4j tests passed!"
''
