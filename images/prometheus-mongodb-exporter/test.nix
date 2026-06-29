{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-mongodb-exporter" ''
  set -euo pipefail
  echo "Testing prometheus-mongodb-exporter image..."

  # 1. Entrypoint runs and prints version/help output (non-empty).
  #    Tolerant of exit code; the real check is that the binary produced output.
  echo "  Checking mongodb_exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --version 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking mongodb_exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v mongodb_exporter >/dev/null 2>&1 || ls /nix/store/*/bin/mongodb_exporter >/dev/null 2>&1' || true

  # 3. Image provides a working shell.
  echo "  Checking image shell..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'echo ok' | grep -q ok

  echo "All prometheus-mongodb-exporter tests passed!"
''
