{ pkgs, image }:

pkgs.writeShellScript "test-cri-tools" ''
  set -euo pipefail
  echo "Testing cri-tools image..."

  # 1. Entrypoint runs a version/help command (exit 0, non-empty output).
  echo "  Checking crictl runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking crictl is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v crictl >/dev/null 2>&1 || ls /nix/store/*/bin/crictl >/dev/null 2>&1'

  echo "All cri-tools tests passed!"
''
