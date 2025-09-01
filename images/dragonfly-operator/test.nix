{ pkgs, image }:

pkgs.writeShellScript "test-dragonfly-operator" ''
  set -euo pipefail
  
  echo "🧪 Testing dragonfly-operator image functionality..."
  
  # Test 1: Operator binary availability
  echo "  ✓ Testing operator binary..."
  docker run --rm ${image.imageName}:test which dragonfly-operator | grep -q "/bin/dragonfly-operator"
  
  # Test 2: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test dragonfly-operator --help | grep -q "Usage"
  
  # Test 3: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All dragonfly-operator tests passed!"
''