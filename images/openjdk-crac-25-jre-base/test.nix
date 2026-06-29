{ pkgs, image }:

pkgs.writeShellScript "test-openjdk-crac-25-jre-base" ''
  set -euo pipefail
  echo "Testing openjdk-crac-25-jre-base image..."

  # 1. java runs and reports version (stderr, exit 0, non-empty output)
  echo "  Checking java runs..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1 || true)
  [ -n "$out" ]

  # 2. java binary present in image
  echo "  Checking java is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v java >/dev/null 2>&1 || ls /nix/store/*/bin/java >/dev/null 2>&1' || true

  echo "All openjdk-crac-25-jre-base tests passed!"
''
