{ pkgs, image }:

pkgs.writeShellScript "test-calico-key-cert-provisioner" ''
  set -euo pipefail
  echo "Testing calico-key-cert-provisioner image..."

  # Calico init/job binary (no safe one-shot flag to rely on). Smoke test:
  # the image runs a shell and the entrypoint binary is present in the image.
  echo "  Checking shell runs and binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v key-cert-provisioner >/dev/null 2>&1 || ls /nix/store/*/bin/key-cert-provisioner >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All calico-key-cert-provisioner tests passed!"
''
