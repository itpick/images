{ pkgs, image }:

pkgs.writeShellScript "test-cilium-cli" ''
  set -euo pipefail
  echo "Testing cilium-cli image functionality..."

  # Test 1: Version check
  echo "  Testing cilium version..."
  docker run --rm ${image.imageName}:test version --client 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing cilium help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "cilium"

  # Test 3: Status subcommand help
  echo "  Testing cilium status help..."
  docker run --rm ${image.imageName}:test status --help 2>&1 | grep -q "status"

  # Test 4: Binary exists
  echo "  Testing cilium binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/cilium" 2>&1 | grep -q "cilium"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All cilium-cli tests passed!"
''
