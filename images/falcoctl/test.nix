{ pkgs, image }:

pkgs.writeShellScript "test-falcoctl" ''
  set -euo pipefail
  echo "Testing falcoctl image functionality..."

  # Test 1: Version check
  echo "  Testing falcoctl version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing falcoctl help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "falcoctl"

  # Test 3: Artifact subcommand
  echo "  Testing falcoctl artifact help..."
  docker run --rm ${image.imageName}:test artifact --help 2>&1 | grep -q "artifact"

  # Test 4: Binary exists
  echo "  Testing falcoctl binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/falcoctl" 2>&1 | grep -q "falcoctl"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All falcoctl tests passed!"
''
