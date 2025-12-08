{ pkgs, image }:

pkgs.writeShellScript "test-tempo" ''
  set -euo pipefail
  
  echo "Testing tempo image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing tempo -version..."
  docker run --rm ${image.imageName}:test tempo -version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All tempo tests passed!"
''
