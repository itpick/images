{ pkgs, image }:

pkgs.writeShellScript "test-ko" ''
  set -euo pipefail
  
  echo "🧪 Testing ko image functionality..."
  
  # Test 1: Ko version
  echo "  ✓ Testing ko version..."
  docker run --rm ${image.imageName}:test ko version | grep -q "ko"
  
  # Test 2: Ko help
  echo "  ✓ Testing ko help..."
  docker run --rm ${image.imageName}:test ko --help | grep -q "Usage"
  
  # Test 3: Build command
  echo "  ✓ Testing build command..."
  docker run --rm ${image.imageName}:test ko build --help | grep -q "Usage"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All ko tests passed!"
''