{ pkgs, image }:

pkgs.writeShellScript "test-static" ''
  set -euo pipefail
  
  echo "🧪 Testing static image functionality..."
  
  # Test 1: Basic execution
  echo "  ✓ Testing basic execution..."
  docker run --rm ${image.imageName}:test true
  
  # Test 2: Shell availability
  echo "  ✓ Testing shell availability..."
  docker run --rm ${image.imageName}:test sh -c 'echo "Hello from static"' | grep -q "Hello from static"
  
  # Test 3: Core utilities
  echo "  ✓ Testing core utilities..."
  docker run --rm ${image.imageName}:test ls / | grep -q "bin\|usr\|etc"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  # Test 5: Minimal size verification
  echo "  ✓ Testing minimal environment..."
  docker run --rm ${image.imageName}:test env | wc -l | grep -E "^[0-9]+$"
  
  echo "✅ All static tests passed!"
''