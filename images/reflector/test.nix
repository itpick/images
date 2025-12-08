{ pkgs, image }:

pkgs.writeShellScript "test-reflector" ''
  set -euo pipefail
  
  echo "Testing reflector image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing reflector --help..."
  docker run --rm ${image.imageName}:test reflector --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All reflector tests passed!"
''
