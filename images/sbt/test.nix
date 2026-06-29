{ pkgs, image }:

pkgs.writeShellScript "test-sbt" ''
  set -euo pipefail
  echo "Testing sbt image..."

  # 1. Image runs a shell (smoke test)
  echo "  Checking shell runs..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls -la / >/dev/null && echo ok' | grep -q ok

  # 2. Binary present in image
  echo "  Checking sbt is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v sbt >/dev/null 2>&1 || ls /nix/store/*/bin/sbt >/dev/null 2>&1'

  echo "All sbt tests passed!"
''
