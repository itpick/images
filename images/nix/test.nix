{ pkgs, image }:

pkgs.writeShellScript "test-nix" ''
  set -euo pipefail
  
  echo "🧪 Testing nix image functionality..."
  
  # Test 1: Nix version
  echo "  ✓ Testing nix version..."
  docker run --rm ${image.imageName}:test nix --version | grep -q "nix"
  
  # Test 2: Basic Nix evaluation
  echo "  ✓ Testing basic Nix evaluation..."
  docker run --rm ${image.imageName}:test nix eval --expr "1 + 1" | grep -q "2"
  
  # Test 3: Nix help
  echo "  ✓ Testing nix help..."
  docker run --rm ${image.imageName}:test nix --help | grep -q "Usage"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All nix tests passed!"
''