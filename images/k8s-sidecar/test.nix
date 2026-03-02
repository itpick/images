{ pkgs, image }:

pkgs.writeShellScript "test-k8s-sidecar" ''
  set -euo pipefail

  echo "Testing k8s-sidecar image..."

  echo "  Testing sidecar binary exists..."
  docker run --rm --entrypoint sidecar ${image.imageName}:test --help || \
    docker run --rm --entrypoint sh ${image.imageName}:test -c "ls /nix/store/*/bin/sidecar"

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All k8s-sidecar tests passed!"
''
