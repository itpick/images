{ pkgs, image }:

pkgs.writeShellScript "test-tekton-workingdirinit" ''
  set -euo pipefail
  echo "Testing tekton-workingdirinit image..."

  # 1. Image runs a shell (server/controller binary needs no version flag)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking tekton-workingdirinit is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tekton-workingdirinit >/dev/null 2>&1 || ls /nix/store/*/bin/tekton-workingdirinit >/dev/null 2>&1'

  echo "All tekton-workingdirinit tests passed!"
''
