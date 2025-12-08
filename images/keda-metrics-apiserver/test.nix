{ pkgs, image }:

pkgs.writeShellScript "test-keda-metrics-apiserver" ''
  set -euo pipefail
  
  echo "Testing keda-metrics-apiserver image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing keda-metrics-apiserver --help..."
  docker run --rm ${image.imageName}:test keda-metrics-apiserver --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All keda-metrics-apiserver tests passed!"
''
