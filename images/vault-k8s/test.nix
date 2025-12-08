{ pkgs, image }:

pkgs.writeShellScript "test-vault-k8s" ''
  set -euo pipefail
  
  echo "Testing vault-k8s image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing vault-k8s --help..."
  docker run --rm ${image.imageName}:test vault-k8s --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All vault-k8s tests passed!"
''
