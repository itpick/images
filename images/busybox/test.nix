{ pkgs, image }:

pkgs.writeShellScript "test-busybox" ''
  set -euo pipefail
  
  echo "🧪 Testing busybox image functionality..."
  
  # Test 1: Busybox version
  echo "  ✓ Testing busybox version..."
  docker run --rm ${image.imageName}:test busybox | grep -q "BusyBox"
  
  # Test 2: Core utilities
  echo "  ✓ Testing core utilities..."
  docker run --rm ${image.imageName}:test ls /bin | grep -q "busybox"
  
  # Test 3: Shell functionality
  echo "  ✓ Testing shell functionality..."
  docker run --rm ${image.imageName}:test sh -c 'echo "Hello from busybox"' | grep -q "Hello from busybox"
  
  # Test 4: Common commands
  echo "  ✓ Testing common commands..."
  docker run --rm ${image.imageName}:test which ls | grep -q "/bin/"
  docker run --rm ${image.imageName}:test echo "test" | grep -q "test"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All busybox tests passed!"
''