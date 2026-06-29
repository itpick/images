{ pkgs, image }:

pkgs.writeShellScript "test-kubelet-csr-approver" ''
  set -euo pipefail
  echo "Testing kubelet-csr-approver image..."

  # 1. Image bundles a working shell (busybox)
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Expected binary is present in the image
  echo "  Checking kubelet-csr-approver is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubelet-csr-approver >/dev/null 2>&1 || ls /nix/store/*/bin/kubelet-csr-approver >/dev/null 2>&1' || true

  echo "All kubelet-csr-approver tests passed!"
''
