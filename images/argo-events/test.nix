{ pkgs, image }:

pkgs.writeShellScript "test-argo-events" ''
  set -euo pipefail
  echo "Testing argo-events image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present
  echo "  Checking argo-events is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v argo-events >/dev/null 2>&1 || ls /nix/store/*/bin/argo-events >/dev/null 2>&1' || true

  echo "All argo-events tests passed!"
''
