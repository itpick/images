{ pkgs, image }:

pkgs.writeShellScript "test-pocket-id" ''
  set -euo pipefail
  
  echo "🧪 Testing pocket-id image functionality..."
  
  # Test 1: Pocket ID binary
  echo "  ✓ Testing pocket-id binary..."
  docker run --rm ${image.imageName}:test which pocket-id | grep -q "/bin/pocket-id"
  
  # Test 2: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test pocket-id --help | grep -q "Usage"
  
  # Test 3: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All pocket-id tests passed!"
''