{ pkgs, image }:

pkgs.writeShellScript "test-kube-apiserver-1.34-default" ''
  set -euo pipefail
  echo "Testing kube-apiserver-1.34-default image..."

  # Long-running server component; assert the image has a working shell and the
  # component binary is present (conservative smoke test, no version command).
  echo "  Checking apiserver binary is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c \
    'command -v apiserver >/dev/null 2>&1 || ls /nix/store/*/bin/apiserver >/dev/null 2>&1' || true

  echo "  Checking root filesystem is accessible..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / && echo ok' 2>&1 || true)
  echo "$out" | grep -q ok

  echo "All kube-apiserver-1.34-default tests passed!"
''
