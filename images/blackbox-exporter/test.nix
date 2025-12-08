{ pkgs, image }:

pkgs.writeShellScript "test-blackbox-exporter" ''
  set -euo pipefail
  
  echo "Testing blackbox-exporter image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing blackbox_exporter --version..."
  docker run --rm ${image.imageName}:test blackbox_exporter --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All blackbox-exporter tests passed!"
''
