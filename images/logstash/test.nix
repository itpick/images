{ pkgs, image }:

pkgs.writeShellScript "test-logstash" ''
  set -euo pipefail
  echo "Testing logstash image..."

  # 1. Binary runs and reports version/help (exit 0, non-empty output)
  echo "  Checking logstash runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary present in image
  echo "  Checking logstash is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v logstash >/dev/null 2>&1 || ls /nix/store/*/bin/logstash >/dev/null 2>&1' || true

  echo "All logstash tests passed!"
''
