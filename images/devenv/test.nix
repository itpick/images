{ pkgs, image }:

pkgs.writeShellScript "test-devenv" ''
  set -euo pipefail
  
  echo "🧪 Testing devenv image functionality..."
  
  # Test 1: Devenv availability
  echo "  ✓ Testing devenv command..."
  docker run --rm ${image.imageName}:test devenv --version | grep -q "devenv"
  
  # Test 2: Nix availability
  echo "  ✓ Testing nix command..."
  docker run --rm ${image.imageName}:test nix --version | grep -q "nix"
  
  # Test 3: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test devenv --help | grep -q "Usage"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All devenv tests passed!"
''