{ pkgs, image }:

pkgs.writeShellScript "test-wiremock" ''
  set -euo pipefail
  echo "Testing wiremock image..."

  # wiremock launches a (blocking) mock server by default, so we avoid running the
  # entrypoint and instead smoke-test the image: shell works and the binary is present.

  # 1. Shell smoke test
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking wiremock is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v wiremock >/dev/null 2>&1 || ls /nix/store/*/bin/wiremock >/dev/null 2>&1'

  echo "All wiremock tests passed!"
''
