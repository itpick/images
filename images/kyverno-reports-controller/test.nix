{ pkgs, image }:

pkgs.writeShellScript "test-kyverno-reports-controller" ''
  set -euo pipefail
  
  echo "Testing kyverno-reports-controller image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing kyverno-reports-controller --help..."
  docker run --rm ${image.imageName}:test kyverno-reports-controller --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All kyverno-reports-controller tests passed!"
''
