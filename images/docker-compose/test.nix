{ pkgs, image }:

pkgs.writeShellScript "test-docker-compose" ''
  set -euo pipefail
  
  echo "🧪 Testing docker-compose image functionality..."
  
  # Test 1: Docker Compose version
  echo "  ✓ Testing docker-compose version..."
  docker run --rm ${image.imageName}:test docker-compose --version | grep -q "Docker Compose"
  
  # Test 2: Docker Compose help
  echo "  ✓ Testing docker-compose help..."
  docker run --rm ${image.imageName}:test docker-compose --help | grep -q "Usage"
  
  # Test 3: Configuration validation
  echo "  ✓ Testing config validation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    cat > docker-compose.test.yml << EOF
version: "3.8"
services:
  test:
    image: hello-world
EOF
    docker-compose -f docker-compose.test.yml config
  '
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All docker-compose tests passed!"
''