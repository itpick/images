{ pkgs, image }:

pkgs.writeShellScript "test-python" ''
  set -euo pipefail
  
  echo "🧪 Testing python image functionality..."
  
  # Test 1: Python version and basic execution
  echo "  ✓ Testing python version..."
  docker run --rm ${image.imageName}:test python --version | grep -q "Python 3"
  
  # Test 2: Basic Python code execution
  echo "  ✓ Testing basic Python execution..."
  docker run --rm ${image.imageName}:test python -c "print('Hello from Python')" | grep -q "Hello from Python"
  
  # Test 3: Pip availability and functionality
  echo "  ✓ Testing pip availability..."
  docker run --rm ${image.imageName}:test pip --version | grep -q "pip"
  
  # Test 4: Module imports
  echo "  ✓ Testing standard library imports..."
  docker run --rm ${image.imageName}:test python -c "import json, os, sys; print('Imports work')" | grep -q "Imports work"
  
  # Test 5: Package installation test
  echo "  ✓ Testing package installation..."
  docker run --rm ${image.imageName}:test bash -c 'pip install --user requests && python -c "import requests; print(\"Package install works\")"' | grep -q "Package install works"
  
  # Test 6: User environment
  echo "  ✓ Testing user environment..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All python tests passed!"
''