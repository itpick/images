{ pkgs, image }:

pkgs.writeShellScript "test-cilium-operator-aws" ''
  set -euo pipefail
  echo "Testing cilium-operator-aws image..."

  # The operator is a long-running daemon, so assert the image has a
  # working shell/filesystem and that the operator binary is present.
  echo "  Checking image shell and filesystem..."
  out=$(docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok')
  [ "$out" = "ok" ]

  echo "  Checking cilium-operator-aws is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cilium-operator-aws >/dev/null 2>&1 || ls /nix/store/*/bin/cilium-operator-aws >/dev/null 2>&1'

  echo "All cilium-operator-aws tests passed!"
''
