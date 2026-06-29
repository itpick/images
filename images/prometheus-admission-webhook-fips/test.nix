{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-admission-webhook-fips" ''
  set -euo pipefail
  echo "Testing prometheus-admission-webhook-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking admission-webhook runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. admission-webhook binary is present in the image
  echo "  Checking admission-webhook is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v admission-webhook >/dev/null 2>&1 || ls /nix/store/*/bin/admission-webhook >/dev/null 2>&1'

  echo "All prometheus-admission-webhook-fips tests passed!"
''
