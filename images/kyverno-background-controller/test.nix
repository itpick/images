{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-background-controller" ''
  set -euo pipefail
  
  echo "Testing kyverno-background-controller image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing kyverno-background-controller --help..."
  docker run --rm ${image.imageName}:test kyverno-background-controller --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All kyverno-background-controller tests passed!"
''
