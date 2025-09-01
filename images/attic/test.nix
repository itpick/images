{ pkgs, image }:

pkgs.writeShellScript "test-attic" ''
  set -euo pipefail
  
  echo "🧪 Testing attic image functionality..."
  
  # Test 1: Attic version
  echo "  ✓ Testing attic version..."
  docker run --rm ${image.imageName}:test attic --version | grep -q "attic"
  
  # Test 2: Attic help
  echo "  ✓ Testing attic help..."
  docker run --rm ${image.imageName}:test attic --help | grep -q "Usage"
  
  # Test 3: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All attic tests passed!"
''