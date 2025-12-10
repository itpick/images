{ pkgs, image }:

pkgs.writeShellScript "test-cilium-agent" ''
  set -euo pipefail
  echo "Testing cilium-agent image functionality..."

  # Test 1: Version check
  echo "  Testing cilium-agent version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing cilium-agent help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -qE "(cilium|agent)"

  # Test 3: Binary exists
  echo "  Testing cilium-agent binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/cilium-agent" 2>&1 | grep -q "cilium-agent"

  # Test 4: IP tool available
  echo "  Testing ip tool available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ip --version" 2>&1 | grep -qE "(iproute|ip utility)"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All cilium-agent tests passed!"
''
