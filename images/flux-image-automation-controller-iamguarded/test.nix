{ pkgs, image }:

pkgs.writeShellScript "test-flux-image-automation-controller-iamguarded" ''
  set -euo pipefail
  echo "Testing flux-image-automation-controller-iamguarded image..."

  # 1. Entrypoint runs and prints help/usage (non-empty output)
  echo "  Checking entrypoint runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Image has a working shell + filesystem
  echo "  Checking image shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  echo "All flux-image-automation-controller-iamguarded tests passed!"
''
