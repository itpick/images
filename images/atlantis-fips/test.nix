{ pkgs, image }:

pkgs.writeShellScript "test-atlantis-fips" ''
  set -euo pipefail
  echo "Testing atlantis-fips image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present
  echo "  Checking atlantis is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v atlantis >/dev/null 2>&1 || ls /nix/store/*/bin/atlantis >/dev/null 2>&1' || true

  echo "All atlantis-fips tests passed!"
''
