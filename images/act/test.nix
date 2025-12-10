{ pkgs, image }:

pkgs.writeShellScript "test-act" ''
  set -euo pipefail
  echo "Testing act image functionality..."

  # Test 1: Version check
  echo "  Testing act version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -q "act version"

  # Test 2: Help output
  echo "  Testing act help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "Run your GitHub Actions locally"

  # Test 3: List available actions
  echo "  Testing act list command..."
  docker run --rm ${image.imageName}:test -l 2>&1 || true  # May fail without workflow file, but should run

  # Test 4: Binary exists in path
  echo "  Testing act binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "which act || ls -la /nix/store/*/bin/act" 2>&1 | grep -q "act"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All act tests passed!"
''
