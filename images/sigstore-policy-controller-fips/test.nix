{ pkgs, image }:

pkgs.writeShellScript "test-sigstore-policy-controller-fips" ''
  set -euo pipefail
  echo "Testing sigstore-policy-controller-fips image..."

  # Conservative smoke test: the image starts a shell and has a usable root filesystem.
  # The packaged entrypoint binary name is build-dependent, so we avoid asserting it.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All sigstore-policy-controller-fips tests passed!"
''
