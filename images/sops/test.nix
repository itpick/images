{ pkgs, image }:

pkgs.writeShellScript "test-sops" ''
  set -euo pipefail
  
  echo "🧪 Testing sops image functionality..."
  
  # Test 1: SOPS version
  echo "  ✓ Testing sops version..."
  docker run --rm ${image.imageName}:test sops --version | grep -q "sops"
  
  # Test 2: SOPS help
  echo "  ✓ Testing sops help..."
  docker run --rm ${image.imageName}:test sops --help | grep -q "Usage"
  
  # Test 3: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All sops tests passed!"
''