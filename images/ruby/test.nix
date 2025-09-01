{ pkgs, image }:

pkgs.writeShellScript "test-ruby" ''
  set -euo pipefail
  
  echo "🧪 Testing ruby image functionality..."
  
  # Test 1: Ruby version
  echo "  ✓ Testing ruby version..."
  docker run --rm ${image.imageName}:test ruby --version | grep -q "ruby"
  
  # Test 2: Basic Ruby execution
  echo "  ✓ Testing Ruby execution..."
  docker run --rm ${image.imageName}:test ruby -e 'puts "Hello from Ruby"' | grep -q "Hello from Ruby"
  
  # Test 3: Gem availability
  echo "  ✓ Testing gem command..."
  docker run --rm ${image.imageName}:test gem --version | grep -q "[0-9]"
  
  # Test 4: IRB availability
  echo "  ✓ Testing irb availability..."
  docker run --rm ${image.imageName}:test which irb | grep -q "/bin/irb"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All ruby tests passed!"
''