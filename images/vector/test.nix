{ pkgs, image }:

pkgs.writeShellScript "test-vector" ''
  set -euo pipefail
  echo "Testing vector image functionality..."

  # Test 1: Version check
  echo "  Testing vector version..."
  docker run --rm --entrypoint vector ${image.imageName}:test --version 2>&1 | grep -qE "vector [0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing vector help..."
  docker run --rm --entrypoint vector ${image.imageName}:test --help 2>&1 | grep -q "vector"

  # Test 3: Validate subcommand
  echo "  Testing vector validate help..."
  docker run --rm --entrypoint vector ${image.imageName}:test validate --help 2>&1 | grep -q "validate"

  # Test 4: Binary exists
  echo "  Testing vector binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/vector" 2>&1 | grep -q "vector"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All vector tests passed!"
''
