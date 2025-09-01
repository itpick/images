{ pkgs, image }:

pkgs.writeShellScript "test-cachix" ''
  set -euo pipefail
  
  echo "🧪 Testing cachix image functionality..."
  
  # Test 1: Cachix version
  echo "  ✓ Testing cachix version..."
  docker run --rm ${image.imageName}:test cachix --version | grep -q "cachix"
  
  # Test 2: Cachix help
  echo "  ✓ Testing cachix help..."
  docker run --rm ${image.imageName}:test cachix --help | grep -q "Usage"
  
  # Test 3: Use command
  echo "  ✓ Testing use command..."
  docker run --rm ${image.imageName}:test cachix use --help | grep -q "Usage"
  
  # Test 4: Push command
  echo "  ✓ Testing push command..."
  docker run --rm ${image.imageName}:test cachix push --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All cachix tests passed!"
''