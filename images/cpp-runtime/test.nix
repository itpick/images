{ pkgs, image }:

pkgs.writeShellScript "test-cpp-runtime" ''
  set -euo pipefail
  
  echo "🧪 Testing cpp-runtime image functionality..."
  
  # Test 1: C++ standard library
  echo "  ✓ Testing C++ standard library..."
  docker run --rm ${image.imageName}:test ls /usr/lib | grep -q "libstdc++"
  
  # Test 2: Glibc runtime
  echo "  ✓ Testing glibc runtime..."
  docker run --rm ${image.imageName}:test ldd --version | grep -q "GNU libc"
  
  # Test 3: Basic execution environment
  echo "  ✓ Testing basic execution..."
  docker run --rm ${image.imageName}:test true
  
  # Test 4: Shell availability
  echo "  ✓ Testing shell availability..."
  docker run --rm ${image.imageName}:test sh -c 'echo "Hello from cpp-runtime"' | grep -q "Hello from cpp-runtime"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All cpp-runtime tests passed!"
''