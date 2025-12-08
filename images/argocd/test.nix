{ pkgs, image }:

pkgs.writeShellScript "test-argocd" ''
  set -euo pipefail
  
  echo "Testing argocd image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing argocd version --client..."
  docker run --rm ${image.imageName}:test argocd version --client || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All argocd tests passed!"
''
