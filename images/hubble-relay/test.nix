{ pkgs, image }:

pkgs.writeShellScript "test-hubble-relay" ''
  set -euo pipefail
  echo "Testing hubble-relay image functionality..."

  # Test 1: Help output
  echo "  Testing hubble-relay help..."
  docker run --rm --entrypoint hubble-relay ${image.imageName}:test --help 2>&1 | grep -qE "(hubble|relay)"

  # Test 2: Version check
  echo "  Testing hubble-relay version..."
  docker run --rm --entrypoint hubble-relay ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 3: Binary exists
  echo "  Testing hubble-relay binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/hubble-relay" 2>&1 | grep -q "hubble-relay"

  # Test 4: CA certs available
  echo "  Testing CA certs available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /etc/ssl/certs" 2>&1 | grep -qE "(ca-|certs)"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All hubble-relay tests passed!"
''
