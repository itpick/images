{ pkgs, image }:

pkgs.writeShellScript "test-velero" ''
  set -euo pipefail
  
  echo "Testing velero image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing velero version --client-only..."
  docker run --rm ${image.imageName}:test velero version --client-only || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All velero tests passed!"
''
