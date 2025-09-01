{ pkgs, image }:

pkgs.writeShellScript "test-valkey" ''
  set -euo pipefail
  
  echo "🧪 Testing valkey image functionality..."
  
  # Test 1: Valkey server version
  echo "  ✓ Testing valkey-server version..."
  docker run --rm ${image.imageName}:test valkey-server --version | grep -q "Valkey"
  
  # Test 2: Valkey CLI availability
  echo "  ✓ Testing valkey-cli..."
  docker run --rm ${image.imageName}:test valkey-cli --version | grep -q "valkey-cli"
  
  # Test 3: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test valkey-server --help | grep -q "Usage"
  
  # Test 4: Configuration check
  echo "  ✓ Testing configuration..."
  docker run --rm ${image.imageName}:test bash -c '
    echo "port 6379" > /tmp/valkey.conf &&
    valkey-server /tmp/valkey.conf --test-config
  '
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All valkey tests passed!"
''