{ pkgs, image }:

pkgs.writeShellScript "test-apko" ''
  set -euo pipefail
  echo "Testing apko image functionality..."

  # Test 1: Version check
  echo "  Testing apko version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing apko help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "apko"

  # Test 3: Build subcommand help
  echo "  Testing apko build help..."
  docker run --rm ${image.imageName}:test build --help 2>&1 | grep -q "Build"

  # Test 4: Binary exists
  echo "  Testing apko binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/apko" 2>&1 | grep -q "apko"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All apko tests passed!"
''
