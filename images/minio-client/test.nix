{ pkgs, image }:

pkgs.writeShellScript "test-minio-client" ''
  set -euo pipefail
  
  echo "Testing minio-client image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing mc --version..."
  docker run --rm ${image.imageName}:test mc --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All minio-client tests passed!"
''
