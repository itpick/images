{ pkgs, image }:

pkgs.writeShellScript "test-nats" ''
  set -euo pipefail
  echo "Testing nats image functionality..."

  # Test 1: Version check
  echo "  Testing nats-server version..."
  docker run --rm --entrypoint nats-server ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing nats-server help..."
  docker run --rm --entrypoint nats-server ${image.imageName}:test --help 2>&1 | grep -q "nats"

  # Test 3: Signal options
  echo "  Testing nats-server options..."
  docker run --rm --entrypoint nats-server ${image.imageName}:test --help 2>&1 | grep -qE "(config|port)"

  # Test 4: Binary exists
  echo "  Testing nats-server binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/nats-server" 2>&1 | grep -q "nats-server"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All nats tests passed!"
''
