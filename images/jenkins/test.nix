{ pkgs, image }:

pkgs.writeShellScript "test-jenkins" ''
  set -euo pipefail
  echo "Testing jenkins image..."

  # 1. Entrypoint is java; java -version exits 0 and prints to stderr.
  echo "  Checking java runs..."
  out=$(docker run --rm ${image.imageName}:test -version 2>&1)
  [ -n "$out" ]

  # 2. java is present in the image.
  echo "  Checking java is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v java >/dev/null 2>&1 || ls /nix/store/*/bin/java >/dev/null 2>&1'

  echo "All jenkins tests passed!"
''
