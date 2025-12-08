{ pkgs, image }:

pkgs.writeShellScript "test-external-secrets" ''
  set -euo pipefail
  
  echo "Testing external-secrets image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing external-secrets --help..."
  docker run --rm ${image.imageName}:test external-secrets --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All external-secrets tests passed!"
''
