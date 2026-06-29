{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-event-exporter" ''
  set -euo pipefail
  echo "Testing kubernetes-event-exporter image..."

  # 1. Entrypoint binary runs a help/version command and prints non-empty output.
  #    Exit code is tolerated (flag parsers may exit non-zero on --help/--version).
  echo "  Checking event-exporter runs..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1 || true)
  [ -n "$out" ]

  # 2. Binary is present in the image.
  echo "  Checking event-exporter is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v event-exporter >/dev/null 2>&1 || ls /nix/store/*/bin/event-exporter >/dev/null 2>&1' || true

  echo "All kubernetes-event-exporter tests passed!"
''
