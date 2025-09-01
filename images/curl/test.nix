{ pkgs, image }:

pkgs.writeShellScript "test-curl" ''
  set -euo pipefail
  
  echo "🧪 Testing curl image functionality..."
  
  # Test 1: Curl version and help
  echo "  ✓ Testing curl version..."
  docker run --rm ${image.imageName}:test curl --version | grep -q "curl"
  
  # Test 2: HTTPS connectivity (test against httpbin.org)
  echo "  ✓ Testing HTTPS connectivity..."
  docker run --rm ${image.imageName}:test curl -s https://httpbin.org/get | grep -q "origin"
  
  # Test 3: SSL certificate validation
  echo "  ✓ Testing SSL certificate validation..."
  docker run --rm ${image.imageName}:test curl -s https://google.com | grep -q "Google"
  
  # Test 4: Basic HTTP methods
  echo "  ✓ Testing HTTP methods..."
  docker run --rm ${image.imageName}:test curl -s -X POST https://httpbin.org/post -d "test=data" | grep -q "test"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All curl tests passed!"
''