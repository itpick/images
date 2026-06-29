{ pkgs, image }:

pkgs.writeShellScript "test-cluster-proportional-autoscaler" ''
  set -euo pipefail
  echo "Testing cluster-proportional-autoscaler image..."

  # 1. Entrypoint runs help (cmd = ["--help"]) and prints non-empty output.
  echo "  Checking cluster-proportional-autoscaler runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in the image.
  echo "  Checking cluster-proportional-autoscaler is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v cluster-proportional-autoscaler >/dev/null 2>&1 || ls /nix/store/*/bin/cluster-proportional-autoscaler >/dev/null 2>&1'

  echo "All cluster-proportional-autoscaler tests passed!"
''
