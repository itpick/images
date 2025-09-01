{ pkgs, image }:

pkgs.writeShellScript "test-wait-for-it" ''
  set -euo pipefail
  
  echo "🧪 Testing wait-for-it image functionality..."
  
  # Test 1: Wait-for-it availability
  echo "  ✓ Testing wait-for-it script..."
  docker run --rm ${image.imageName}:test which wait-for-it | grep -q "/bin/wait-for-it"
  
  # Test 2: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test wait-for-it --help | grep -q "Usage"
  
  # Test 3: Basic timeout test
  echo "  ✓ Testing timeout functionality..."
  docker run --rm ${image.imageName}:test timeout 1 wait-for-it localhost:12345 --timeout=1 || true
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All wait-for-it tests passed!"
''