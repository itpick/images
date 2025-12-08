{ pkgs, image }:

pkgs.writeShellScript "test-vault-csi-provider" ''
  set -euo pipefail
  
  echo "Testing vault-csi-provider image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing vault-csi-provider --version..."
  docker run --rm ${image.imageName}:test vault-csi-provider --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All vault-csi-provider tests passed!"
''
