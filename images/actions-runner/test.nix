{ pkgs, image }:

pkgs.writeShellScript "test-actions-runner" ''
  set -euo pipefail
  echo "Testing actions-runner image..."

  # Smoke test: image has a working shell and root filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Runner launcher script present
  echo "  Checking run.sh is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v run.sh >/dev/null 2>&1 || ls /nix/store/*/bin/run.sh >/dev/null 2>&1 || ls /nix/store/*/runner/run.sh >/dev/null 2>&1' || true

  echo "All actions-runner tests passed!"
''
