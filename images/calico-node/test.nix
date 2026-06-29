{ pkgs, image }:

pkgs.writeShellScript "test-calico-node" ''
  set -euo pipefail
  echo "Testing calico-node image..."

  # calico-node daemon (no safe one-shot flag to rely on). Smoke test:
  # the image runs a shell and the entrypoint binary is present in the image.
  echo "  Checking shell runs and binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v node >/dev/null 2>&1 || ls /nix/store/*/bin/node >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All calico-node tests passed!"
''
