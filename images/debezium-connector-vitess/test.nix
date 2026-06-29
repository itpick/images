{ pkgs, image }:

pkgs.writeShellScript "test-debezium-connector-vitess" ''
  set -euo pipefail
  echo "Testing debezium-connector-vitess image..."

  # Bundled JDK runs (java -version prints to stderr, exits 0, non-empty)
  echo "  Checking java runs..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1)
  [ -n "$out" ]

  echo "All debezium-connector-vitess tests passed!"
''
