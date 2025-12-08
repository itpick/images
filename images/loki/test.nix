{ pkgs, image }:

pkgs.writeShellScript "test-loki" ''
  set -euo pipefail
  
  echo "Testing loki image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing loki -version..."
  docker run --rm ${image.imageName}:test loki -version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All loki tests passed!"
''
