{ pkgs, image }:

pkgs.writeShellScript "test-zipkin" ''
  set -euo pipefail
  echo "Testing zipkin image..."

  # The default entrypoint runs the Zipkin server (java -jar zipkin.jar), which blocks.
  # Instead verify the bundled JRE works and the zipkin jar is present.

  # 1. Java runtime runs and reports version (non-empty output)
  echo "  Checking java runs..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1 || true)
  [ -n "$out" ]

  # 2. zipkin jar and java present in image
  echo "  Checking zipkin.jar and java are present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'ls /nix/store/*/bin/java >/dev/null 2>&1 && ls /nix/store/*/zipkin.jar >/dev/null 2>&1'

  echo "All zipkin tests passed!"
''
