{ pkgs, image }:

pkgs.writeShellScript "test-calico-pod2daemon-flexvol-fips" ''
  set -euo pipefail
  echo "Testing calico-pod2daemon-flexvol-fips image..."

  # Smoke test: image provides a working shell and root filesystem
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All calico-pod2daemon-flexvol-fips tests passed!"
''
