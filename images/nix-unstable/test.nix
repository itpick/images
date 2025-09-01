{ pkgs, image }:

pkgs.writeShellScript "test-nix-unstable" ''
  set -euo pipefail
  
  echo "🧪 Testing nix-unstable image functionality..."
  
  # Test 1: Nix version
  echo "  ✓ Testing nix version..."
  docker run --rm ${image.imageName}:test nix --version | grep -q "nix"
  
  # Test 2: Experimental features
  echo "  ✓ Testing experimental features..."
  docker run --rm ${image.imageName}:test nix eval --expr "1 + 1" | grep -q "2"
  
  # Test 3: Flakes support
  echo "  ✓ Testing flakes support..."
  docker run --rm ${image.imageName}:test nix flake --help | grep -q "Usage"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All nix-unstable tests passed!"
''