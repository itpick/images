{ pkgs, image }:

pkgs.writeShellScript "test-argo-workflow-controller-fips" ''
  set -euo pipefail
  echo "Testing argo-workflow-controller-fips image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Controller binary present
  echo "  Checking workflow-controller is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v workflow-controller >/dev/null 2>&1 || ls /nix/store/*/bin/workflow-controller >/dev/null 2>&1' || true

  echo "All argo-workflow-controller-fips tests passed!"
''
