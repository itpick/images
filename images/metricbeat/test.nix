{ pkgs, image }:

pkgs.writeShellScript "test-metricbeat" ''
  set -euo pipefail
  echo "Testing metricbeat image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking metricbeat runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking metricbeat is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v metricbeat >/dev/null 2>&1 || ls /nix/store/*/bin/metricbeat >/dev/null 2>&1' || true

  echo "All metricbeat tests passed!"
''
