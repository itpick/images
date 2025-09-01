{ pkgs, image }:

pkgs.writeShellScript "test-node" ''
  set -euo pipefail
  
  echo "🧪 Testing node image functionality..."
  
  # Test 1: Node version
  echo "  ✓ Testing node version..."
  docker run --rm ${image.imageName}:test node --version | grep -q "v"
  
  # Test 2: NPM version
  echo "  ✓ Testing npm version..."
  docker run --rm ${image.imageName}:test npm --version | grep -q "[0-9]"
  
  # Test 3: Basic JavaScript execution
  echo "  ✓ Testing JavaScript execution..."
  docker run --rm ${image.imageName}:test node -e "console.log('Hello from Node')" | grep -q "Hello from Node"
  
  # Test 4: Package installation
  echo "  ✓ Testing package installation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf node-test &&
    mkdir node-test &&
    cd node-test &&
    npm init -y &&
    npm install lodash --prefix . &&
    node -e "const _ = require(\"./node_modules/lodash\"); console.log(\"Package works\")"
  ' | grep -q "Package works"
  
  # Test 5: Yarn availability
  echo "  ✓ Testing yarn availability..."
  docker run --rm ${image.imageName}:test yarn --version | grep -q "[0-9]"
  
  echo "✅ All node tests passed!"
''