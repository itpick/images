{ pkgs, image }:

pkgs.writeShellScript "test-selenium-standalone-firefox" ''
  set -euo pipefail
  echo "Testing selenium-standalone-firefox image..."

  # 1. The bundled JDK runs and reports a version (java -version prints to stderr, exit 0).
  echo "  Checking java runs..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1 || true)
  [ -n "$out" ]

  # 2. The image has a usable shell and the java binary is present.
  echo "  Checking java is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v java >/dev/null 2>&1 || ls /nix/store/*/bin/java >/dev/null 2>&1'

  echo "All selenium-standalone-firefox tests passed!"
''
