{ pkgs, image }:

pkgs.writeShellScript "test-hugo" ''
  set -euo pipefail
  
  echo "🧪 Testing hugo image functionality..."
  
  # Test 1: Hugo version
  echo "  ✓ Testing hugo version..."
  docker run --rm ${image.imageName}:test hugo version | grep -q "hugo"
  
  # Test 2: Hugo help
  echo "  ✓ Testing hugo help..."
  docker run --rm ${image.imageName}:test hugo --help | grep -q "Usage"
  
  # Test 3: Site creation
  echo "  ✓ Testing site creation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf hugo-test &&
    hugo new site hugo-test &&
    ls hugo-test | grep -q "config"
  '
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All hugo tests passed!"
''