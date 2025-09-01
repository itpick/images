{ pkgs, image }:

pkgs.writeShellScript "test-devcontainer" ''
  set -euo pipefail
  
  echo "🧪 Testing devcontainer image functionality..."
  
  # Test 1: Development tools availability
  echo "  ✓ Testing development tools..."
  docker run --rm ${image.imageName}:test which git | grep -q "/bin/git"
  docker run --rm ${image.imageName}:test which curl | grep -q "/bin/curl"
  
  # Test 2: Shell environment
  echo "  ✓ Testing shell environment..."
  docker run --rm ${image.imageName}:test bash --version | grep -q "GNU bash"
  
  # Test 3: Basic utilities
  echo "  ✓ Testing basic utilities..."
  docker run --rm ${image.imageName}:test ls --version | grep -q "coreutils"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All devcontainer tests passed!"
''