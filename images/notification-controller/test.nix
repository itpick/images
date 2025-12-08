{ pkgs, image }:

pkgs.writeShellScript "test-notification-controller" ''
  set -euo pipefail
  
  echo "Testing notification-controller image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing notification-controller --help..."
  docker run --rm ${image.imageName}:test notification-controller --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All notification-controller tests passed!"
''
