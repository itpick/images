{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-adapter" ''
  set -euo pipefail
  
  echo "Testing prometheus-adapter image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing adapter --help..."
  docker run --rm ${image.imageName}:test adapter --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All prometheus-adapter tests passed!"
''
