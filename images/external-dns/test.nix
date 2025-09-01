{ pkgs, image }:

pkgs.writeShellScript "test-external-dns" ''
  set -euo pipefail
  
  echo "🧪 Testing external-dns image functionality..."
  
  # Test 1: External DNS binary
  echo "  ✓ Testing external-dns binary..."
  docker run --rm ${image.imageName}:test which external-dns | grep -q "/bin/external-dns"
  
  # Test 2: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test external-dns --help | grep -q "Usage"
  
  # Test 3: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All external-dns tests passed!"
''