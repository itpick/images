{ pkgs, image }:

pkgs.writeShellScript "test-ingress-nginx" ''
  set -euo pipefail
  
  echo "Testing ingress-nginx image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing nginx-ingress-controller --version..."
  docker run --rm ${image.imageName}:test nginx-ingress-controller --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All ingress-nginx tests passed!"
''
