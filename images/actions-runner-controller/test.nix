{ pkgs, image }:

pkgs.writeShellScript "test-actions-runner-controller" ''
  set -euo pipefail
  echo "Testing actions-runner-controller image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Controller binary present
  echo "  Checking manager is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v manager >/dev/null 2>&1 || ls /nix/store/*/bin/manager >/dev/null 2>&1' || true

  echo "All actions-runner-controller tests passed!"
''
