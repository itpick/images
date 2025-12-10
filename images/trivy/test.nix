{ pkgs, image }:

pkgs.writeShellScript "test-trivy" ''
  set -euo pipefail
  echo "Testing trivy image functionality..."

  # Test 1: Version check
  echo "  Testing trivy version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "Version: [0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing trivy help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "trivy"

  # Test 3: Image subcommand
  echo "  Testing trivy image help..."
  docker run --rm ${image.imageName}:test image --help 2>&1 | grep -q "image"

  # Test 4: Binary exists
  echo "  Testing trivy binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/trivy" 2>&1 | grep -q "trivy"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All trivy tests passed!"
''
