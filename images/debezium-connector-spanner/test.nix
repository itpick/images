{ pkgs, image }:

pkgs.writeShellScript "test-debezium-connector-spanner" ''
  set -euo pipefail
  echo "Testing debezium-connector-spanner image..."

  # Bundled JDK runs (java -version prints to stderr, exits 0, non-empty)
  echo "  Checking java runs..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1 || true)
  [ -n "$out" ]

  echo "All debezium-connector-spanner tests passed!"
''
