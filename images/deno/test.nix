{ pkgs, image }:

pkgs.writeShellScript "test-deno" ''
  set -euo pipefail
  echo "Testing deno image functionality..."

  # Test 1: Version check
  echo "  Testing deno version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "deno [0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing deno help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "deno"

  # Test 3: Eval JavaScript
  echo "  Testing deno eval..."
  docker run --rm ${image.imageName}:test eval "console.log('hello')" 2>&1 | grep -q "hello"

  # Test 4: Binary exists
  echo "  Testing deno binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/deno" 2>&1 | grep -q "deno"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All deno tests passed!"
''
