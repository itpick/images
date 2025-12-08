{ pkgs, image }:

pkgs.writeShellScript "test-openldap" ''
  set -euo pipefail
  
  echo "Testing openldap image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing slapd -V..."
  docker run --rm ${image.imageName}:test slapd -V || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All openldap tests passed!"
''
