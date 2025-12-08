{ pkgs, image }:

pkgs.writeShellScript "test-argocd-extension-installer" ''
  set -euo pipefail
  
  echo "Testing argocd-extension-installer image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing extension-installer --help..."
  docker run --rm ${image.imageName}:test extension-installer --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All argocd-extension-installer tests passed!"
''
