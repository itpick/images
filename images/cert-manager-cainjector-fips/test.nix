{ pkgs, image }:

pkgs.writeShellScript "test-cert-manager-cainjector-fips" ''
  set -euo pipefail
  echo "Testing cert-manager-cainjector-fips image..."

  # 1. Entrypoint runs --help and prints non-empty output (tolerate exit code)
  echo "  Checking cert-manager-cainjector --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking cert-manager-cainjector is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cert-manager-cainjector >/dev/null 2>&1 || ls /nix/store/*/bin/cert-manager-cainjector >/dev/null 2>&1'

  echo "All cert-manager-cainjector-fips tests passed!"
''
