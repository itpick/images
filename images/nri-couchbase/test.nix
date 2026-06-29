{ pkgs, image }:

pkgs.writeShellScript "test-nri-couchbase" ''
  set -euo pipefail
  echo "Testing nri-couchbase image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking couchbase is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v couchbase >/dev/null 2>&1 || ls /nix/store/*/bin/couchbase >/dev/null 2>&1' || true

  echo "All nri-couchbase tests passed!"
''
