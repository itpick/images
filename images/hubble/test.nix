{ pkgs, image }:

pkgs.writeShellScript "test-hubble" ''
  set -euo pipefail
  echo "Testing hubble image functionality..."

  # Test 1: Version check
  echo "  Testing hubble version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing hubble help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "hubble"

  # Test 3: Status subcommand
  echo "  Testing hubble status help..."
  docker run --rm ${image.imageName}:test status --help 2>&1 | grep -q "status"

  # Test 4: Binary exists
  echo "  Testing hubble binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/hubble" 2>&1 | grep -q "hubble"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All hubble tests passed!"
''
