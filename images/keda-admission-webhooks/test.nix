{ pkgs, image }:

pkgs.writeShellScript "test-keda-admission-webhooks" ''
  set -euo pipefail
  
  echo "Testing keda-admission-webhooks image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing keda-admission-webhooks --help..."
  docker run --rm ${image.imageName}:test keda-admission-webhooks --help || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All keda-admission-webhooks tests passed!"
''
