{ pkgs, image }:

pkgs.writeShellScript "test-keda-admission-webhooks" ''
  set -euo pipefail

  echo "Testing keda-admission-webhooks image..."

  echo "  Testing keda-admission-webhooks --help..."
  docker run --rm ${image.imageName}:test keda-admission-webhooks --help

  echo "  Testing non-root user..."
  docker run --rm --entrypoint id ${image.imageName}:test -u | grep -qE "^(65534|1000)$"

  echo "All keda-admission-webhooks tests passed!"
''
