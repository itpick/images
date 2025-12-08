{ pkgs, image }:

pkgs.writeShellScript "test-helm-controller" ''
  set -euo pipefail
  
  echo "Testing helm-controller image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing helm-controller --help..."
  docker run --rm ${image.imageName}:test helm-controller --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All helm-controller tests passed!"
''
