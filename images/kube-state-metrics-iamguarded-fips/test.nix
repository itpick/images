{ pkgs, image }:

pkgs.writeShellScript "test-kube-state-metrics-iamguarded-fips" ''
  set -euo pipefail
  echo "Testing kube-state-metrics-iamguarded-fips image..."

  # 1. Image runs a shell and the root filesystem is intact
  echo "  Checking shell + filesystem..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kube-state-metrics-iamguarded is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kube-state-metrics-iamguarded >/dev/null 2>&1 || ls /nix/store/*/bin/kube-state-metrics-iamguarded >/dev/null 2>&1'

  echo "All kube-state-metrics-iamguarded-fips tests passed!"
''
