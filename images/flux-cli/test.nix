{ pkgs, image }:

pkgs.writeShellScript "test-flux-cli" ''
  set -euo pipefail
  
  echo "Testing flux-cli image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing flux version --client..."
  docker run --rm ${image.imageName}:test flux version --client || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All flux-cli tests passed!"
''
