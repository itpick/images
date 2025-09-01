{ pkgs, image }:

pkgs.writeShellScript "test-cachix-flakes" ''
  set -euo pipefail
  
  echo "🧪 Testing cachix-flakes image functionality..."
  
  # Test 1: Cachix version
  echo "  ✓ Testing cachix version..."
  docker run --rm ${image.imageName}:test cachix --version | grep -q "cachix"
  
  # Test 2: Nix flakes support
  echo "  ✓ Testing nix flakes..."
  docker run --rm ${image.imageName}:test nix --version | grep -q "nix"
  
  # Test 3: Flakes evaluation
  echo "  ✓ Testing flakes evaluation..."
  docker run --rm ${image.imageName}:test nix eval --expr "1 + 1" | grep -q "2"
  
  # Test 4: Cachix with flakes
  echo "  ✓ Testing cachix help..."
  docker run --rm ${image.imageName}:test cachix --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All cachix-flakes tests passed!"
''