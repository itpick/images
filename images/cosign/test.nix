{ pkgs, image }:

pkgs.writeShellScript "test-cosign" ''
  set -euo pipefail
  
  echo "🧪 Testing cosign image functionality..."
  
  # Test 1: Cosign version
  echo "  ✓ Testing cosign version..."
  docker run --rm ${image.imageName}:test cosign version | grep -q "cosign"
  
  # Test 2: Cosign help
  echo "  ✓ Testing cosign help..."
  docker run --rm ${image.imageName}:test cosign --help | grep -q "Usage"
  
  # Test 3: Key generation test
  echo "  ✓ Testing key generation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    COSIGN_PASSWORD="" cosign generate-key-pair --output-key-prefix test
    ls test.key test.pub
  '
  
  # Test 4: Verify command availability
  echo "  ✓ Testing verify command..."
  docker run --rm ${image.imageName}:test cosign verify --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All cosign tests passed!"
''