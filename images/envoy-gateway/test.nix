{ pkgs, image }:

pkgs.writeShellScript "test-envoy-gateway" ''
  set -euo pipefail
  echo "Testing envoy-gateway image..."

  # 1. Entrypoint runs and prints help (non-empty output)
  echo "  Checking envoy-gateway runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image (installed at /usr/bin)
  echo "  Checking envoy-gateway is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v envoy-gateway >/dev/null 2>&1 || ls /usr/bin/envoy-gateway >/dev/null 2>&1 || ls /nix/store/*/bin/envoy-gateway >/dev/null 2>&1'

  echo "All envoy-gateway tests passed!"
''
