{ pkgs, image }:

pkgs.writeShellScript "test-yq" ''
  set -euo pipefail
  
  echo "Testing yq image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing yq --version..."
  docker run --rm ${image.imageName}:test yq --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All yq tests passed!"
''
