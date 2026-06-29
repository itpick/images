{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-pause" ''
  set -euo pipefail
  echo "Testing kubernetes-pause image..."

  # Smoke test: image runs a shell.
  echo "  Checking shell works..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # Binary present in image.
  echo "  Checking pause is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v pause >/dev/null 2>&1 || ls /nix/store/*/bin/pause >/dev/null 2>&1'

  echo "All kubernetes-pause tests passed!"
''
