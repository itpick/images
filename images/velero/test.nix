{ pkgs, image }:

pkgs.writeShellScript "test-velero" ''
  set -euo pipefail

  echo "Testing velero image..."

  echo "  Testing velero version --client-only..."
  docker run --rm --entrypoint velero ${image.imageName}:test version --client-only

  echo "  Testing restic binary..."
  docker run --rm --entrypoint restic ${image.imageName}:test version

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All velero tests passed!"
''
