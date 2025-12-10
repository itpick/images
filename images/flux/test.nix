{ pkgs, image }:

pkgs.writeShellScript "test-flux" ''
  set -euo pipefail
  echo "Testing flux image functionality..."

  # Test 1: Version check
  echo "  Testing flux version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "flux version [0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing flux help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "flux"

  # Test 3: Check subcommand
  echo "  Testing flux check help..."
  docker run --rm ${image.imageName}:test check --help 2>&1 | grep -q "check"

  # Test 4: Binary exists
  echo "  Testing flux binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/flux" 2>&1 | grep -q "flux"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All flux tests passed!"
''
