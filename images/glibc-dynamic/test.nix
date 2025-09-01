{ pkgs, image }:

pkgs.writeShellScript "test-glibc-dynamic" ''
  set -euo pipefail
  
  echo "🧪 Testing glibc-dynamic image functionality..."
  
  # Test 1: Glibc availability
  echo "  ✓ Testing glibc availability..."
  docker run --rm ${image.imageName}:test ldd --version | grep -q "GNU libc"
  
  # Test 2: Dynamic linking test
  echo "  ✓ Testing dynamic linking..."
  docker run --rm ${image.imageName}:test bash -c 'echo "#include <stdio.h>
int main() { printf(\"Hello from glibc\\n\"); return 0; }" > /tmp/test.c && gcc /tmp/test.c -o /tmp/test && /tmp/test' | grep -q "Hello from glibc"
  
  # Test 3: Library paths
  echo "  ✓ Testing library paths..."
  docker run --rm ${image.imageName}:test ls /lib | grep -q "libc"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All glibc-dynamic tests passed!"
''