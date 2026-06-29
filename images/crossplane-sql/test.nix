{ pkgs, image }:

pkgs.writeShellScript "test-crossplane-sql" ''
  set -euo pipefail
  echo "Testing crossplane-sql image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking provider is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v provider >/dev/null 2>&1 || ls /nix/store/*/bin/provider >/dev/null 2>&1'

  echo "All crossplane-sql tests passed!"
''
