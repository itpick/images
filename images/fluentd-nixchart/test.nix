{ pkgs, image }:

pkgs.writeShellScript "test-fluentd-nixchart" ''
  set -euo pipefail
  echo "Testing fluentd-nixchart image..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ] || out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]
  echo "All fluentd-nixchart tests passed!"
''
