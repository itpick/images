{ pkgs, image }:

pkgs.writeShellScript "test-cilium-operator" ''
  set -euo pipefail
  echo "Testing cilium-operator image functionality..."

  # Test 1: Version check
  echo "  Testing cilium-operator version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing cilium-operator help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -qE "(cilium|operator)"

  # Test 3: Binary exists
  echo "  Testing cilium-operator binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/cilium-operator" 2>&1 | grep -q "cilium-operator"

  # Test 4: CA certs available
  echo "  Testing CA certs available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /etc/ssl/certs" 2>&1 | grep -qE "(ca-|certs)"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All cilium-operator tests passed!"
''
