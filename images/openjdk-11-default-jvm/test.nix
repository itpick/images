{ pkgs, image }:

pkgs.writeShellScript "test-openjdk-11-default-jvm" ''
  set -euo pipefail
  echo "Testing openjdk-11-default-jvm image..."

  # 1. java runs and reports its version (note: 'java -version' prints to stderr, exit 0)
  echo "  Checking java runs..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1)
  [ -n "$out" ]

  # 2. java present in image
  echo "  Checking java is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v java >/dev/null 2>&1 || ls /nix/store/*/bin/java >/dev/null 2>&1'

  echo "All openjdk-11-default-jvm tests passed!"
''
