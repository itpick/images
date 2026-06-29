{ pkgs, image }:

pkgs.writeShellScript "test-knative-eventing-webhook" ''
  set -euo pipefail
  echo "Testing knative-eventing-webhook image..."

  # Long-running server component; assert the image has a working shell and the
  # component binary is present (conservative smoke test, no version command).
  echo "  Checking knative-eventing-webhook binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v knative-eventing-webhook >/dev/null 2>&1 || ls /nix/store/*/bin/knative-eventing-webhook >/dev/null 2>&1'

  echo "  Checking root filesystem is accessible..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / && echo ok' 2>&1)
  echo "$out" | grep -q ok

  echo "All knative-eventing-webhook tests passed!"
''
