{ pkgs, image }:

pkgs.writeShellScript "test-caddy" ''
  set -euo pipefail
  
  echo "🧪 Testing caddy image functionality..."
  
  # Test 1: Caddy version
  echo "  ✓ Testing caddy version..."
  docker run --rm ${image.imageName}:test caddy version | grep -q "v[0-9]"
  
  # Test 2: Caddy help
  echo "  ✓ Testing caddy help..."
  docker run --rm ${image.imageName}:test caddy --help | grep -q "Usage"
  
  # Test 3: Configuration validation
  echo "  ✓ Testing configuration validation..."
  docker run --rm ${image.imageName}:test caddy validate --config /dev/null 2>&1 | grep -q "config"
  
  # Test 4: List modules
  echo "  ✓ Testing module listing..."
  docker run --rm ${image.imageName}:test caddy list-modules | grep -q "http"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All caddy tests passed!"
''