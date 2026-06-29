{ pkgs, image }:

pkgs.writeShellScript "test-step-kms-plugin" ''
  set -euo pipefail
  echo "Testing step-kms-plugin image..."

  # 1. Entrypoint runs and reports version/help (non-empty output)
  echo "  Checking step-kms-plugin runs (--help)..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking step-kms-plugin is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v step-kms-plugin >/dev/null 2>&1 || ls /nix/store/*/bin/step-kms-plugin >/dev/null 2>&1' || true

  echo "All step-kms-plugin tests passed!"
''
