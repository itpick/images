{ pkgs, image }:

pkgs.writeShellScript "test-kubelet-1.33-default" ''
  set -euo pipefail
  echo "Testing kubelet-1.33-default image..."

  # 1. Binary runs and reports a version (exit 0, non-empty output)
  echo "  Checking kubelet --version..."
  out=$(docker run --rm --entrypoint kubelet ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 3. Binary present in the image
  echo "  Checking kubelet is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubelet >/dev/null 2>&1 || ls /nix/store/*/bin/kubelet >/dev/null 2>&1'

  echo "All kubelet-1.33-default tests passed!"
''
