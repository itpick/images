{ pkgs, image }:

pkgs.writeShellScript "test-php" ''
  set -euo pipefail
  
  echo "🧪 Testing php image functionality..."
  
  # Test 1: PHP version
  echo "  ✓ Testing php version..."
  docker run --rm ${image.imageName}:test php --version | grep -q "PHP [0-9]"
  
  # Test 2: PHP CLI execution
  echo "  ✓ Testing PHP CLI execution..."
  docker run --rm ${image.imageName}:test php -r 'echo "Hello from PHP\n";' | grep -q "Hello from PHP"
  
  # Test 3: PHP configuration
  echo "  ✓ Testing PHP configuration..."
  docker run --rm ${image.imageName}:test php --ini | grep -q "Configuration File"
  
  # Test 4: PHP modules
  echo "  ✓ Testing PHP modules..."
  docker run --rm ${image.imageName}:test php -m | grep -q "curl\|json\|mbstring"
  
  # Test 5: Basic script execution
  echo "  ✓ Testing script execution..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    echo "<?php echo \"Hello World from PHP script\"; ?>" > test.php &&
    php test.php
  ' | grep -q "Hello World from PHP script"
  
  # Test 6: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All php tests passed!"
''