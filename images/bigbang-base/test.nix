{ pkgs, image }:

pkgs.writeShellScript "test-bigbang-base" ''
  set -euo pipefail
  echo "Testing bigbang-base image..."

  # Utility container (bash entrypoint, no single primary CLI). Smoke test:
  # the image runs a shell and the bundled tools are present in the image.
  echo "  Checking shell runs and bundled tools are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v kubectl >/dev/null 2>&1 || ls /nix/store/*/bin/kubectl >/dev/null 2>&1) && (command -v jq >/dev/null 2>&1 || ls /nix/store/*/bin/jq >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All bigbang-base tests passed!"
''
