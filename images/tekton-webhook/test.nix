{ pkgs, image }:

pkgs.writeShellScript "test-tekton-webhook" ''
  set -euo pipefail
  echo "Testing tekton-webhook image..."

  # 1. Image runs a shell (server/controller binary needs no version flag)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking tekton-webhook is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tekton-webhook >/dev/null 2>&1 || ls /nix/store/*/bin/tekton-webhook >/dev/null 2>&1'

  echo "All tekton-webhook tests passed!"
''
