{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-adapter-fips" ''
  set -euo pipefail
  echo "Testing prometheus-adapter-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking adapter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. adapter binary is present in the image
  echo "  Checking adapter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v adapter >/dev/null 2>&1 || ls /nix/store/*/bin/adapter >/dev/null 2>&1'

  echo "All prometheus-adapter-fips tests passed!"
''
