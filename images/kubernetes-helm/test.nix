{ pkgs, image }:

pkgs.writeShellScript "test-kubernetes-helm" ''
  set -euo pipefail
  
  echo "🧪 Testing kubernetes-helm image functionality..."
  
  # Test 1: Helm version
  echo "  ✓ Testing helm version..."
  docker run --rm ${image.imageName}:test helm version | grep -q "version"
  
  # Test 2: Kubectl version
  echo "  ✓ Testing kubectl version..."
  docker run --rm ${image.imageName}:test kubectl version --client | grep -q "Client Version"
  
  # Test 3: Helm help
  echo "  ✓ Testing helm help..."
  docker run --rm ${image.imageName}:test helm --help | grep -q "Usage"
  
  # Test 4: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All kubernetes-helm tests passed!"
''