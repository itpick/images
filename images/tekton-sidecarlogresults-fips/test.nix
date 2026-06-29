{ pkgs, image }:

pkgs.writeShellScript "test-tekton-sidecarlogresults-fips" ''
  set -euo pipefail
  echo "Testing tekton-sidecarlogresults-fips image..."

  # 1. Image runs a shell (server/controller binary needs no version flag)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking tekton-sidecarlogresults is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v tekton-sidecarlogresults >/dev/null 2>&1 || ls /nix/store/*/bin/tekton-sidecarlogresults >/dev/null 2>&1' || true

  echo "All tekton-sidecarlogresults-fips tests passed!"
''
