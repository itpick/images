{ pkgs, image }:

pkgs.writeShellScript "test-bash" ''
  set -euo pipefail
  
  echo "🧪 Testing bash image functionality..."
  
  # Test 1: Basic bash execution
  echo "  ✓ Testing basic bash execution..."
  docker run --rm ${image.imageName}:test bash -c 'echo "Hello from bash"' | grep -q "Hello from bash"
  
  # Test 2: Bash function execution
  echo "  ✓ Testing bash function execution..."
  docker run --rm ${image.imageName}:test bash -c 'function hello() { echo "hello world"; }; hello' | grep -q "hello world"
  
  # Test 3: Core utilities availability
  echo "  ✓ Testing core utilities..."
  docker run --rm ${image.imageName}:test bash -c 'ls /bin/bash && which coreutils >/dev/null || which ls >/dev/null'
  
  # Test 4: Environment variables
  echo "  ✓ Testing environment setup..."
  docker run --rm ${image.imageName}:test bash -c 'echo $HOME' | grep -q "/home/nonroot"
  
  # Test 5: User permissions
  echo "  ✓ Testing non-root user..."
  docker run --rm ${image.imageName}:test bash -c 'id -u' | grep -q "1000"
  
  echo "✅ All bash tests passed!"
''