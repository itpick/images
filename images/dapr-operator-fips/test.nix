{ pkgs, image }:

pkgs.writeShellScript "test-dapr-operator-fips" ''
  set -euo pipefail
  echo "Testing dapr-operator-fips image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking dapr-operator is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v dapr-operator >/dev/null 2>&1 || ls /nix/store/*/bin/dapr-operator >/dev/null 2>&1'

  echo "All dapr-operator-fips tests passed!"
''
