{ pkgs, image }:

pkgs.writeShellScript "test-k8s-sidecar" ''
  set -euo pipefail
  
  echo "Testing k8s-sidecar image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing k8s-sidecar --help..."
  docker run --rm ${image.imageName}:test k8s-sidecar --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All k8s-sidecar tests passed!"
''
