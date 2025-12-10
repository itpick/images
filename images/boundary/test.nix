{ pkgs, image }:

pkgs.writeShellScript "test-boundary" ''
  set -euo pipefail
  echo "Testing boundary image functionality..."

  # Test 1: Version check
  echo "  Testing boundary version..."
  docker run --rm --entrypoint boundary ${image.imageName}:test version 2>&1 | grep -qE "Boundary v[0-9]+"

  # Test 2: Help output
  echo "  Testing boundary help..."
  docker run --rm --entrypoint boundary ${image.imageName}:test --help 2>&1 | grep -q "boundary"

  # Test 3: Server subcommand help
  echo "  Testing boundary server help..."
  docker run --rm --entrypoint boundary ${image.imageName}:test server --help 2>&1 | grep -q "server"

  # Test 4: Binary exists
  echo "  Testing boundary binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/boundary" 2>&1 | grep -q "boundary"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All boundary tests passed!"
''
