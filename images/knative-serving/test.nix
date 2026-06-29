{ pkgs, image }:

pkgs.writeShellScript "test-knative-serving" ''
  set -euo pipefail
  echo "Testing knative-serving image..."

  # Long-running server component; assert the image has a working shell and the
  # component binary is present (conservative smoke test, no version command).
  echo "  Checking knative-serving binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v knative-serving >/dev/null 2>&1 || ls /nix/store/*/bin/knative-serving >/dev/null 2>&1'

  echo "  Checking root filesystem is accessible..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / && echo ok' 2>&1)
  echo "$out" | grep -q ok

  echo "All knative-serving tests passed!"
''
