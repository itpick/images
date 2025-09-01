{ pkgs, image }:

pkgs.writeShellScript "test-kubectl" ''
  set -euo pipefail
  
  echo "🧪 Testing kubectl image functionality..."
  
  # Test 1: Kubectl version
  echo "  ✓ Testing kubectl version..."
  docker run --rm ${image.imageName}:test kubectl version --client | grep -q "Client Version"
  
  # Test 2: Kubectl help
  echo "  ✓ Testing kubectl help..."
  docker run --rm ${image.imageName}:test kubectl --help | grep -q "Usage"
  
  # Test 3: Get command
  echo "  ✓ Testing get command..."
  docker run --rm ${image.imageName}:test kubectl get --help | grep -q "Usage"
  
  # Test 4: Apply command
  echo "  ✓ Testing apply command..."
  docker run --rm ${image.imageName}:test kubectl apply --help | grep -q "Usage"
  
  # Test 5: Config command
  echo "  ✓ Testing config command..."
  docker run --rm ${image.imageName}:test kubectl config --help | grep -q "Usage"
  
  # Test 6: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All kubectl tests passed!"
''