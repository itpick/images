{ pkgs, image }:

pkgs.writeShellScript "test-rclone" ''
  set -euo pipefail
  echo "Testing rclone image functionality..."

  # Test 1: Version check
  echo "  Testing rclone version..."
  docker run --rm --entrypoint rclone ${image.imageName}:test version 2>&1 | grep -qE "rclone v[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing rclone help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -q "rclone"

  # Test 3: Config subcommand
  echo "  Testing rclone config help..."
  docker run --rm --entrypoint rclone ${image.imageName}:test config --help 2>&1 | grep -q "config"

  # Test 4: Binary exists
  echo "  Testing rclone binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/rclone" 2>&1 | grep -q "rclone"

  # Test 5: User setup (should be root)
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=0|root)"

  echo "All rclone tests passed!"
''
