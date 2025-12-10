{ pkgs, image }:

pkgs.writeShellScript "test-cadvisor" ''
  set -euo pipefail
  echo "Testing cadvisor image functionality..."

  # Test 1: Version check
  echo "  Testing cadvisor version..."
  docker run --rm --entrypoint cadvisor ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing cadvisor help..."
  docker run --rm --entrypoint cadvisor ${image.imageName}:test --help 2>&1 | grep -q "cadvisor"

  # Test 3: Binary exists
  echo "  Testing cadvisor binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/cadvisor" 2>&1 | grep -q "cadvisor"

  # Test 4: Check default flags
  echo "  Testing cadvisor default behavior..."
  docker run --rm --entrypoint cadvisor ${image.imageName}:test --help 2>&1 | grep -q "logtostderr"

  # Test 5: User setup (should be root)
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=0|root)"

  echo "All cadvisor tests passed!"
''
