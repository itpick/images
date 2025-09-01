{ pkgs, image }:

pkgs.writeShellScript "test-redis" ''
  set -euo pipefail
  
  echo "🧪 Testing redis image functionality..."
  
  # Test 1: Redis server version
  echo "  ✓ Testing redis version..."
  docker run --rm ${image.imageName}:test redis-server --version | grep -q "Redis server"
  
  # Test 2: Redis CLI availability
  echo "  ✓ Testing redis-cli availability..."
  docker run --rm ${image.imageName}:test which redis-cli | grep -q "redis-cli"
  
  # Test 3: Redis CLI version
  echo "  ✓ Testing redis-cli version..."
  docker run --rm ${image.imageName}:test redis-cli --version | grep -q "redis-cli"
  
  # Test 4: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test redis-server --help | grep -q "Usage"
  
  echo "✅ All redis tests passed!"
''