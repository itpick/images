{ pkgs, image }:

pkgs.writeShellScript "test-syncthing" ''
  set -euo pipefail
  echo "Testing syncthing image functionality..."

  # Test 1: Version check
  echo "  Testing syncthing version..."
  docker run --rm --entrypoint syncthing ${image.imageName}:test --version 2>&1 | grep -qE "syncthing v[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing syncthing help..."
  docker run --rm --entrypoint syncthing ${image.imageName}:test --help 2>&1 | grep -q "syncthing"

  # Test 3: Generate config option
  echo "  Testing syncthing options..."
  docker run --rm --entrypoint syncthing ${image.imageName}:test --help 2>&1 | grep -qE "(gui|config)"

  # Test 4: Binary exists
  echo "  Testing syncthing binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/syncthing" 2>&1 | grep -q "syncthing"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All syncthing tests passed!"
''
