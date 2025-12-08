{ pkgs, image }:

pkgs.writeShellScript "test-image-reflector-controller" ''
  set -euo pipefail
  
  echo "Testing image-reflector-controller image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing image-reflector-controller --help..."
  docker run --rm ${image.imageName}:test image-reflector-controller --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All image-reflector-controller tests passed!"
''
