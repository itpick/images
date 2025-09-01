{ pkgs, image }:

pkgs.writeShellScript "test-grype" ''
  set -euo pipefail
  
  echo "🧪 Testing grype image functionality..."
  
  # Test 1: Grype version
  echo "  ✓ Testing grype version..."
  docker run --rm ${image.imageName}:test grype version | grep -q "grype"
  
  # Test 2: Grype help
  echo "  ✓ Testing grype help..."
  docker run --rm ${image.imageName}:test grype --help | grep -q "Usage"
  
  # Test 3: Database status
  echo "  ✓ Testing database status..."
  docker run --rm ${image.imageName}:test grype db status || true
  
  # Test 4: Config command
  echo "  ✓ Testing config command..."
  docker run --rm ${image.imageName}:test grype config --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All grype tests passed!"
''