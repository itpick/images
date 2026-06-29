{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-replicator-fips" ''
  set -euo pipefail
  echo "Testing kubernetes-replicator-fips image..."

  # Smoke test: image runs a shell.
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image.
  echo "  Checking replicator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v replicator >/dev/null 2>&1 || ls /nix/store/*/bin/replicator >/dev/null 2>&1'

  echo "All kubernetes-replicator-fips tests passed!"
''
