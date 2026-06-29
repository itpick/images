{ pkgs, image }:

pkgs.writeShellScript "test-nri-cassandra-fips" ''
  set -euo pipefail
  echo "Testing nri-cassandra-fips image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking cassandra is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cassandra >/dev/null 2>&1 || ls /nix/store/*/bin/cassandra >/dev/null 2>&1'

  echo "All nri-cassandra-fips tests passed!"
''
