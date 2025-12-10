{ pkgs, image }:

pkgs.writeShellScript "test-restic" ''
  set -euo pipefail
  echo "Testing restic image functionality..."

  # Test 1: Version check
  echo "  Testing restic version..."
  docker run --rm --entrypoint restic ${image.imageName}:test version 2>&1 | grep -qE "restic [0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing restic help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -q "restic"

  # Test 3: Backup subcommand
  echo "  Testing restic backup help..."
  docker run --rm --entrypoint restic ${image.imageName}:test backup --help 2>&1 | grep -q "backup"

  # Test 4: Binary exists
  echo "  Testing restic binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/restic" 2>&1 | grep -q "restic"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All restic tests passed!"
''
