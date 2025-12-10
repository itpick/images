{ pkgs, image }:

pkgs.writeShellScript "test-bun" ''
  set -euo pipefail
  echo "Testing bun image functionality..."

  # Test 1: Version check
  echo "  Testing bun version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing bun help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "bun"

  # Test 3: Eval JavaScript
  echo "  Testing bun eval..."
  docker run --rm ${image.imageName}:test -e "console.log('hello')" 2>&1 | grep -q "hello"

  # Test 4: Binary exists
  echo "  Testing bun binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/bun" 2>&1 | grep -q "bun"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All bun tests passed!"
''
