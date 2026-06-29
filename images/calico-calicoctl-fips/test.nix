{ pkgs, image }:

pkgs.writeShellScript "test-calico-calicoctl-fips" ''
  set -euo pipefail
  echo "Testing calico-calicoctl-fips image..."

  # calicoctl is a CLI but `version` reaches out to a cluster; keep the test
  # conservative. Smoke test: the image runs a shell and the binary is present.
  echo "  Checking shell runs and binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v calico-calicoctl >/dev/null 2>&1 || ls /nix/store/*/bin/calico-calicoctl >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All calico-calicoctl-fips tests passed!"
''
