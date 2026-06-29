{ pkgs, image }:

pkgs.writeShellScript "test-calico-cni-fips" ''
  set -euo pipefail
  echo "Testing calico-cni-fips image..."

  # CNI plugin invoked by the kubelet over stdin/env (no version flag). Smoke test:
  # the image runs a shell and the entrypoint binary is present in the image.
  echo "  Checking shell runs and binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v calico-cni >/dev/null 2>&1 || ls /nix/store/*/bin/calico-cni >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All calico-cni-fips tests passed!"
''
