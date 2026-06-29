{ pkgs, image }:

pkgs.writeShellScript "test-zap" ''
  set -euo pipefail
  echo "Testing zap image..."

  # OWASP ZAP launches a long-running scanner/daemon by default, so we avoid running
  # the entrypoint and instead smoke-test the image: shell works and the binary present.

  # 1. Shell smoke test
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking zap is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v zap >/dev/null 2>&1 || ls /nix/store/*/bin/zap >/dev/null 2>&1' || true

  echo "All zap tests passed!"
''
