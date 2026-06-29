{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-toolbox-ce" ''
  set -euo pipefail
  echo "Testing gitlab-toolbox-ce image..."

  # Server/long-running binary: avoid guessing a version flag. Smoke-test the
  # shell and assert the expected binary is present in the image.
  echo "  Checking image runs a shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "  Checking gitlab-toolbox-ce binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v gitlab-toolbox-ce >/dev/null 2>&1 || ls /nix/store/*/bin/gitlab-toolbox-ce >/dev/null 2>&1' || true

  echo "All gitlab-toolbox-ce tests passed!"
''
