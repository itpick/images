{ pkgs, image }:

pkgs.writeShellScript "test-nix-flakes" ''
  set -euo pipefail
  
  echo "🧪 Testing nix-flakes image functionality..."
  
  # Test 1: Nix version
  echo "  ✓ Testing nix version..."
  docker run --rm ${image.imageName}:test nix --version | grep -q "nix"
  
  # Test 2: Flakes support
  echo "  ✓ Testing flakes support..."
  docker run --rm ${image.imageName}:test nix flake --help | grep -q "Usage"
  
  # Test 3: Flakes evaluation
  echo "  ✓ Testing flakes evaluation..."
  docker run --rm ${image.imageName}:test nix eval --expr "1 + 1" | grep -q "2"
  
  # Test 4: Git availability
  echo "  ✓ Testing git availability..."
  docker run --rm ${image.imageName}:test git --version | grep -q "git"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All nix-flakes tests passed!"
''