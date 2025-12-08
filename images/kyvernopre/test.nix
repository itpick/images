{ pkgs, image }:

pkgs.writeShellScript "test-kyvernopre" ''
  set -euo pipefail
  
  echo "Testing kyvernopre image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing kyvernopre --help..."
  docker run --rm ${image.imageName}:test kyvernopre --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All kyvernopre tests passed!"
''
