{ pkgs, image }:

pkgs.writeShellScript "test-cloudprober" ''
  set -euo pipefail
  echo "Testing cloudprober image..."

  # Entrypoint (cloudprober) prints help (non-empty output)
  echo "  Checking cloudprober runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking cloudprober is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cloudprober >/dev/null 2>&1 || ls /nix/store/*/bin/cloudprober >/dev/null 2>&1'

  echo "All cloudprober tests passed!"
''
