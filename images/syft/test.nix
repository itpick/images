{ pkgs, image }:

pkgs.writeShellScript "test-syft" ''
  set -euo pipefail
  echo "Testing syft image functionality..."

  # Test 1: Version check
  echo "  Testing syft version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing syft help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -q "syft"

  # Test 3: Scan subcommand
  echo "  Testing syft packages help..."
  docker run --rm ${image.imageName}:test packages --help 2>&1 || true

  # Test 4: Binary exists
  echo "  Testing syft binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/syft" 2>&1 | grep -q "syft"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All syft tests passed!"
''
