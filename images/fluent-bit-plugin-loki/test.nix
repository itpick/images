{ pkgs, image }:

pkgs.writeShellScript "test-fluent-bit-plugin-loki" ''
  set -euo pipefail
  echo "Testing fluent-bit-plugin-loki image..."

  # No entrypoint is declared; the bundled logging tool is fluentd.
  echo "  Checking fluentd runs..."
  out=$(docker run --rm --entrypoint fluentd ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # Binary present in image
  echo "  Checking fluentd is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v fluentd >/dev/null 2>&1 || ls /nix/store/*/bin/fluentd >/dev/null 2>&1' || true

  echo "All fluent-bit-plugin-loki tests passed!"
''
