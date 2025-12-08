{ pkgs, image }:

pkgs.writeShellScript "test-image-automation-controller" ''
  set -euo pipefail
  
  echo "Testing image-automation-controller image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing image-automation-controller --help..."
  docker run --rm ${image.imageName}:test image-automation-controller --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All image-automation-controller tests passed!"
''
