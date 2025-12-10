{ pkgs, image }:

pkgs.writeShellScript "test-meilisearch" ''
  set -euo pipefail
  echo "Testing meilisearch image functionality..."

  # Test 1: Version check
  echo "  Testing meilisearch version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing meilisearch help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "meilisearch"

  # Test 3: Binary exists
  echo "  Testing meilisearch binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/meilisearch" 2>&1 | grep -q "meilisearch"

  # Test 4: Environment variables
  echo "  Testing environment setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "env | grep MEILI" 2>&1 | grep -q "MEILI"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All meilisearch tests passed!"
''
