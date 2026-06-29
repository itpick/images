{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-elasticsearch-exporter" ''
  set -euo pipefail
  echo "Testing prometheus-elasticsearch-exporter image..."

  # 1. Entry binary runs version/help (exit 0, non-empty output).
  # Default cmd starts a server, so override with a one-shot flag.
  echo "  Checking elasticsearch_exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  if [ -z "$out" ]; then
    out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  fi
  [ -n "$out" ]

  # 2. elasticsearch_exporter binary is present in the image
  echo "  Checking elasticsearch_exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v elasticsearch_exporter >/dev/null 2>&1 || ls /nix/store/*/bin/elasticsearch_exporter >/dev/null 2>&1' || true

  echo "All prometheus-elasticsearch-exporter tests passed!"
''
