{ pkgs, image }:

pkgs.writeShellScript "test-calico-typhad-fips" ''
  set -euo pipefail
  echo "Testing calico-typhad-fips image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All calico-typhad-fips tests passed!"
''
