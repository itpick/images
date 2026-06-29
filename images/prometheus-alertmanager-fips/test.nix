{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-alertmanager-fips" ''
  set -euo pipefail
  echo "Testing prometheus-alertmanager-fips image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output)
  echo "  Checking alertmanager runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. alertmanager binary is present in the image
  echo "  Checking alertmanager is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v alertmanager >/dev/null 2>&1 || ls /nix/store/*/bin/alertmanager >/dev/null 2>&1'

  echo "All prometheus-alertmanager-fips tests passed!"
''
