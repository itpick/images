{ pkgs, image }:

pkgs.writeShellScript "test-velero-plugin-for-gcp" ''
  set -euo pipefail
  echo "Testing velero-plugin-for-gcp image..."

  echo "  Testing plugin binary exists..."
  docker run --rm --entrypoint ls ${image.imageName}:test /plugins/velero-plugin-for-gcp

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "  Testing CA certificates..."
  docker run --rm --entrypoint ls ${image.imageName}:test /etc/ssl/certs/ca-bundle.crt

  echo "All velero-plugin-for-gcp tests passed!"
''
