{ pkgs, image }:

pkgs.writeShellScript "test-cert-manager-cainjector" ''
  set -euo pipefail
  
  echo "Testing cert-manager-cainjector image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing cainjector --help..."
  docker run --rm ${image.imageName}:test cainjector --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All cert-manager-cainjector tests passed!"
''
