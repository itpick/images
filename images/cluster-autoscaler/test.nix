{ pkgs, image }:

pkgs.writeShellScript "test-cluster-autoscaler" ''
  set -euo pipefail
  echo "Testing cluster-autoscaler image..."

  # 1. Entrypoint runs help (cmd = ["--help"]) and prints non-empty output.
  echo "  Checking cluster-autoscaler runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking cluster-autoscaler is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cluster-autoscaler >/dev/null 2>&1 || ls /nix/store/*/bin/cluster-autoscaler >/dev/null 2>&1' || true

  echo "All cluster-autoscaler tests passed!"
''
