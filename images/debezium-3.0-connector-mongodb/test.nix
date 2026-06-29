{ pkgs, image }:

pkgs.writeShellScript "test-debezium-3.0-connector-mongodb" ''
  set -euo pipefail
  echo "Testing debezium-3.0-connector-mongodb image..."

  # Bundled JDK runs (java -version prints to stderr, exits 0, non-empty)
  echo "  Checking java runs..."
  out=$(docker run --rm --entrypoint java ${image.imageName}:test -version 2>&1)
  [ -n "$out" ]

  echo "All debezium-3.0-connector-mongodb tests passed!"
''
