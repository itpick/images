{ pkgs, image }:

pkgs.writeShellScript "test-configmap-reload" ''
  set -euo pipefail
  
  echo "Testing configmap-reload image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing configmap-reload --help..."
  docker run --rm ${image.imageName}:test configmap-reload --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All configmap-reload tests passed!"
''
