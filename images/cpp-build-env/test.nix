{ pkgs, image }:

pkgs.writeShellScript "test-cpp-build-env" ''
  set -euo pipefail
  
  echo "🧪 Testing cpp-build-env image functionality..."
  
  # Test 1: GCC availability
  echo "  ✓ Testing gcc compiler..."
  docker run --rm ${image.imageName}:test gcc --version | grep -q "gcc"
  
  # Test 2: G++ availability  
  echo "  ✓ Testing g++ compiler..."
  docker run --rm ${image.imageName}:test g++ --version | grep -q "g++"
  
  # Test 3: Build tools
  echo "  ✓ Testing build tools..."
  docker run --rm ${image.imageName}:test make --version | grep -q "GNU Make"
  docker run --rm ${image.imageName}:test cmake --version | grep -q "cmake"
  
  # Test 4: C++ compilation test
  echo "  ✓ Testing C++ compilation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    cat > hello.cpp << EOF
#include <iostream>
int main() {
    std::cout << "Hello from C++" << std::endl;
    return 0;
}
EOF
    g++ -o hello hello.cpp &&
    ./hello
  ' | grep -q "Hello from C++"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All cpp-build-env tests passed!"
''