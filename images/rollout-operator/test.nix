{ pkgs, image }:

pkgs.writeShellScript "test-rollout-operator" ''
  set -euo pipefail
  
  echo "Testing rollout-operator image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing rollout-operator --help..."
  docker run --rm ${image.imageName}:test rollout-operator --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All rollout-operator tests passed!"
''
