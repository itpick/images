{ pkgs, image }:

pkgs.writeShellScript "test-kepler" ''
  set -euo pipefail
  echo "Testing kepler image..."

  # Exporter/server image (entrypoint starts the kepler exporter). Smoke test:
  # shell runs and the kepler binary is present in the image.
  echo "  Checking shell and kepler binary are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && (command -v kepler >/dev/null 2>&1 || ls /nix/store/*/bin/kepler >/dev/null 2>&1) && echo ok' | grep -q ok

  echo "All kepler tests passed!"
''
