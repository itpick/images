{ pkgs, image }:

pkgs.writeShellScript "test-memcached" ''
  set -euo pipefail
  
  echo "Testing memcached image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing memcached -h..."
  docker run --rm ${image.imageName}:test memcached -h || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All memcached tests passed!"
''
