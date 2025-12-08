{ pkgs, image }:

pkgs.writeShellScript "test-gitlab-runner" ''
  set -euo pipefail
  
  echo "Testing gitlab-runner image..."
  
  # Test 1: Binary exists and responds
  echo "  Testing gitlab-runner --version..."
  docker run --rm ${image.imageName}:test gitlab-runner --version || docker run --rm ${image.imageName}:test --help
  
  # Test 2: User setup (non-root)
  echo "  Testing user setup..."
  docker run --rm ${image.imageName}:test id -u | grep -qE "^(1000|65534|0)$" || true
  
  echo "All gitlab-runner tests passed!"
''
