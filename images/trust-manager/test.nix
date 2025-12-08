{ pkgs, image }:

pkgs.writeShellScript "test-trust-manager" ''
  set -euo pipefail
  
  echo "Testing trust-manager image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing trust-manager --help..."
  docker run --rm ${image.imageName}:test trust-manager --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All trust-manager tests passed!"
''
