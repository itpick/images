{ pkgs, image }:

pkgs.writeShellScript "test-sigstore-scaffolding-tuf-createsecret-fips" ''
  set -euo pipefail
  echo "Testing sigstore-scaffolding-tuf-createsecret-fips image..."

  # Smoke test: image runs a shell and the root filesystem is populated.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All sigstore-scaffolding-tuf-createsecret-fips tests passed!"
''
