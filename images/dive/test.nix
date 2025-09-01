{ pkgs, image }:

pkgs.writeShellScript "test-dive" ''
  set -euo pipefail
  
  echo "🧪 Testing dive image functionality..."
  
  # Test 1: Dive version
  echo "  ✓ Testing dive version..."
  docker run --rm ${image.imageName}:test dive --version | grep -q "dive"
  
  # Test 2: Dive help
  echo "  ✓ Testing dive help..."
  docker run --rm ${image.imageName}:test dive --help | grep -q "Usage"
  
  # Test 3: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All dive tests passed!"
''