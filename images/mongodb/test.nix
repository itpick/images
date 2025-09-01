{ pkgs, image }:

pkgs.writeShellScript "test-mongodb" ''
  set -euo pipefail
  
  echo "🧪 Testing mongodb image functionality..."
  
  # Test 1: MongoDB version
  echo "  ✓ Testing mongodb version..."
  docker run --rm ${image.imageName}:test mongod --version | grep -q "MongoDB"
  
  # Test 2: Mongo client availability
  echo "  ✓ Testing mongo client..."
  docker run --rm ${image.imageName}:test which mongosh | grep -q "mongosh" || \
  docker run --rm ${image.imageName}:test which mongo | grep -q "mongo"
  
  # Test 3: Help functionality
  echo "  ✓ Testing help functionality..."
  docker run --rm ${image.imageName}:test mongod --help | grep -q "General options"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All mongodb tests passed!"
''