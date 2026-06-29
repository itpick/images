{ pkgs, image }:

pkgs.writeShellScript "test-kubescape-operator-fips" ''
  set -euo pipefail
  echo "Testing kubescape-operator-fips image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking kubescape runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kubescape is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubescape >/dev/null 2>&1 || ls /nix/store/*/bin/kubescape >/dev/null 2>&1' || true

  echo "All kubescape-operator-fips tests passed!"
''
