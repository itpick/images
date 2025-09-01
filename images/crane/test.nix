{ pkgs, image }:

pkgs.writeShellScript "test-crane" ''
  set -euo pipefail
  
  echo "🧪 Testing crane image functionality..."
  
  # Test 1: Crane version
  echo "  ✓ Testing crane version..."
  docker run --rm ${image.imageName}:test crane version | grep -q "crane"
  
  # Test 2: Crane help
  echo "  ✓ Testing crane help..."
  docker run --rm ${image.imageName}:test crane --help | grep -q "Usage"
  
  # Test 3: Manifest command
  echo "  ✓ Testing manifest command..."
  docker run --rm ${image.imageName}:test crane manifest --help | grep -q "Usage"
  
  # Test 4: Config command
  echo "  ✓ Testing config command..."
  docker run --rm ${image.imageName}:test crane config --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All crane tests passed!"
''