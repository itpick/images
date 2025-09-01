{ pkgs, image }:

pkgs.writeShellScript "test-maddy" ''
  set -euo pipefail
  
  echo "🧪 Testing maddy image functionality..."
  
  # Test 1: Maddy version
  echo "  ✓ Testing maddy version..."
  docker run --rm ${image.imageName}:test maddy --version | grep -q "maddy"
  
  # Test 2: Maddy help
  echo "  ✓ Testing maddy help..."
  docker run --rm ${image.imageName}:test maddy --help | grep -q "Usage"
  
  # Test 3: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All maddy tests passed!"
''