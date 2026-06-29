{ pkgs, image }:

pkgs.writeShellScript "test-argocd-image-updater" ''
  set -euo pipefail
  echo "Testing argocd-image-updater image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present
  echo "  Checking argocd-image-updater is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v argocd-image-updater >/dev/null 2>&1 || ls /nix/store/*/bin/argocd-image-updater >/dev/null 2>&1'

  echo "All argocd-image-updater tests passed!"
''
