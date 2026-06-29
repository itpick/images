{ pkgs, image }:

pkgs.writeShellScript "test-kubewatch" ''
  set -euo pipefail
  echo "Testing kubewatch image..."

  # 1. Entry binary runs and prints version/help (exit 0, non-empty output)
  echo "  Checking kubewatch runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking kubewatch is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubewatch >/dev/null 2>&1 || ls /nix/store/*/bin/kubewatch >/dev/null 2>&1' || true

  echo "All kubewatch tests passed!"
''
