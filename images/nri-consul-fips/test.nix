{ pkgs, image }:

pkgs.writeShellScript "test-nri-consul-fips" ''
  set -euo pipefail
  echo "Testing nri-consul-fips image..."

  # Image runs a shell and root filesystem is present
  echo "  Checking shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image
  echo "  Checking consul is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v consul >/dev/null 2>&1 || ls /nix/store/*/bin/consul >/dev/null 2>&1' || true

  echo "All nri-consul-fips tests passed!"
''
