{ pkgs, image }:

pkgs.writeShellScript "test-cni-plugins" ''
  set -euo pipefail
  echo "Testing cni-plugins image..."

  # 1. Image runs a shell (smoke test; binary is a long-running/argument-driven
  #    process with no reliable version/help one-shot, so we don't invoke it).
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image.
  echo "  Checking bridge is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v bridge >/dev/null 2>&1 || ls /nix/store/*/bin/bridge >/dev/null 2>&1'

  echo "All cni-plugins tests passed!"
''
