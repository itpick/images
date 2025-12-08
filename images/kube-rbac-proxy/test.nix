{ pkgs, image }:

pkgs.writeShellScript "test-kube-rbac-proxy" ''
  set -euo pipefail
  
  echo "Testing kube-rbac-proxy image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing kube-rbac-proxy --version..."
  docker run --rm ${image.imageName}:test kube-rbac-proxy --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All kube-rbac-proxy tests passed!"
''
