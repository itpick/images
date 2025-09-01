{ pkgs, image }:

pkgs.writeShellScript "test-helm" ''
  set -euo pipefail
  
  echo "🧪 Testing helm image functionality..."
  
  # Test 1: Helm version
  echo "  ✓ Testing helm version..."
  docker run --rm ${image.imageName}:test helm version | grep -q "version"
  
  # Test 2: Helm help
  echo "  ✓ Testing helm help..."
  docker run --rm ${image.imageName}:test helm --help | grep -q "Usage"
  
  # Test 3: Chart creation
  echo "  ✓ Testing chart creation..."
  docker run --rm -v /tmp:/workspace ${image.imageName}:test bash -c '
    cd /workspace &&
    rm -rf test-chart &&
    helm create test-chart &&
    ls test-chart | grep -q "Chart.yaml"
  '
  
  # Test 4: Template command
  echo "  ✓ Testing template command..."
  docker run --rm ${image.imageName}:test helm template --help | grep -q "Usage"
  
  # Test 5: User setup
  echo "  ✓ Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -q "1000"
  
  echo "✅ All helm tests passed!"
''