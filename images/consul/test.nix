{ pkgs, image }:

pkgs.writeShellScript "test-consul" ''
  set -euo pipefail
  echo "Testing consul image functionality..."

  # Test 1: Version check
  echo "  Testing consul version..."
  docker run --rm --entrypoint consul ${image.imageName}:test version 2>&1 | grep -qE "Consul v[0-9]+"

  # Test 2: Help output
  echo "  Testing consul help..."
  docker run --rm --entrypoint consul ${image.imageName}:test --help 2>&1 | grep -q "consul"

  # Test 3: Members subcommand help
  echo "  Testing consul members help..."
  docker run --rm --entrypoint consul ${image.imageName}:test members --help 2>&1 | grep -q "members"

  # Test 4: Binary exists
  echo "  Testing consul binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/consul" 2>&1 | grep -q "consul"

  # Test 5: User setup (should be root)
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=0|root)"

  echo "All consul tests passed!"
''
