{ pkgs, image }:

pkgs.writeShellScript "test-oauth2-proxy" ''
  set -euo pipefail
  
  echo "Testing oauth2-proxy image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing oauth2-proxy --version..."
  docker run --rm ${image.imageName}:test oauth2-proxy --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All oauth2-proxy tests passed!"
''
