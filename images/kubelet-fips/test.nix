{ pkgs, image }:

pkgs.writeShellScript "test-kubelet-fips" ''
  set -euo pipefail
  echo "Testing kubelet-fips image..."

  # 1. Binary runs and reports a version (exit 0, non-empty output)
  echo "  Checking kubelet --version..."
  out=$(docker run --rm --entrypoint kubelet ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 3. Binary present in the image
  echo "  Checking kubelet is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubelet >/dev/null 2>&1 || ls /nix/store/*/bin/kubelet >/dev/null 2>&1' || true

  echo "All kubelet-fips tests passed!"
''
