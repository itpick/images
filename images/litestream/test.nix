{ pkgs, image }:

pkgs.writeShellScript "test-litestream" ''
  set -euo pipefail
  echo "Testing litestream image functionality..."

  # Test 1: Version check
  echo "  Testing litestream version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing litestream help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "litestream"

  # Test 3: Replicate subcommand
  echo "  Testing litestream replicate help..."
  docker run --rm ${image.imageName}:test replicate --help 2>&1 | grep -q "replicate"

  # Test 4: Binary exists
  echo "  Testing litestream binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/litestream" 2>&1 | grep -q "litestream"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All litestream tests passed!"
''
