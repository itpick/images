{ pkgs, image }:

pkgs.writeShellScript "test-calico-pod2daemon-fips" ''
  set -euo pipefail
  echo "Testing calico-pod2daemon-fips image..."

  # Calico pod2daemon flexvol init binary (no safe one-shot flag to rely on). Smoke test:
  # the image runs a shell and the entrypoint binary is present in the image.
  echo "  Checking shell runs and binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v pod2daemon >/dev/null 2>&1 || ls /nix/store/*/bin/pod2daemon >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All calico-pod2daemon-fips tests passed!"
''
