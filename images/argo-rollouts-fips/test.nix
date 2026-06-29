{ pkgs, image }:

pkgs.writeShellScript "test-argo-rollouts-fips" ''
  set -euo pipefail
  echo "Testing argo-rollouts-fips image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Controller binary present
  echo "  Checking rollouts-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v rollouts-controller >/dev/null 2>&1 || ls /nix/store/*/bin/rollouts-controller >/dev/null 2>&1'

  echo "All argo-rollouts-fips tests passed!"
''
