{ pkgs, image }:

pkgs.writeShellScript "test-calico-goldmane" ''
  set -euo pipefail
  echo "Testing calico-goldmane image..."

  # Calico goldmane daemon (no safe one-shot flag to rely on). Smoke test:
  # the image runs a shell and the entrypoint binary is present in the image.
  echo "  Checking shell runs and binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v goldmane >/dev/null 2>&1 || ls /nix/store/*/bin/goldmane >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All calico-goldmane tests passed!"
''
