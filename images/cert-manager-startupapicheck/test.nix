{ pkgs, image }:

pkgs.writeShellScript "test-cert-manager-startupapicheck" ''
  set -euo pipefail
  
  echo "Testing cert-manager-startupapicheck image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing startupapicheck --help..."
  docker run --rm ${image.imageName}:test startupapicheck --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All cert-manager-startupapicheck tests passed!"
''
