{ pkgs, image }:

pkgs.writeShellScript "test-nginx" ''
  set -euo pipefail
  
  echo "🧪 Testing nginx image functionality..."
  
  # Test 1: Nginx version
  echo "  ✓ Testing nginx version..."
  docker run --rm ${image.imageName}:test nginx -v 2>&1 | grep -q "nginx version"
  
  # Test 2: Configuration test
  echo "  ✓ Testing nginx configuration..."
  docker run --rm ${image.imageName}:test nginx -t 2>&1 | grep -q "test is successful"
  
  # Test 3: Help functionality
  echo "  ✓ Testing nginx help..."
  docker run --rm ${image.imageName}:test nginx -h 2>&1 | grep -q "Usage"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All nginx tests passed!"
''