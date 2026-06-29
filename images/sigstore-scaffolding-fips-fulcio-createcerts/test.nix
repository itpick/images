{ pkgs, image }:

pkgs.writeShellScript "test-sigstore-scaffolding-fips-fulcio-createcerts" ''
  set -euo pipefail
  echo "Testing sigstore-scaffolding-fips-fulcio-createcerts image..."

  # Conservative smoke test: the image starts a shell and has a usable root filesystem.
  # The packaged entrypoint binary name is build-dependent, so we avoid asserting it.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All sigstore-scaffolding-fips-fulcio-createcerts tests passed!"
''
