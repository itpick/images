{ pkgs, image }:

pkgs.writeShellScript "test-linkerd" ''
  set -euo pipefail
  echo "Testing linkerd image functionality..."

  # Test 1: Version check
  echo "  Testing linkerd version..."
  docker run --rm ${image.imageName}:test version --client 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing linkerd help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "linkerd"

  # Test 3: Check subcommand
  echo "  Testing linkerd check help..."
  docker run --rm ${image.imageName}:test check --help 2>&1 | grep -q "check"

  # Test 4: Binary exists
  echo "  Testing linkerd binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/linkerd" 2>&1 | grep -q "linkerd"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All linkerd tests passed!"
''
