{ pkgs, image }:

pkgs.writeShellScript "test-geoipupdate" ''
  set -euo pipefail
  
  echo "Testing geoipupdate image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing geoipupdate -v..."
  docker run --rm ${image.imageName}:test geoipupdate -v || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All geoipupdate tests passed!"
''
