{ pkgs, image }:

pkgs.writeShellScript "test-renovate" ''
  set -euo pipefail
  echo "Testing renovate image functionality..."

  # Test 1: Version check
  echo "  Testing renovate version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing renovate help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -qE "(renovate|dependency)"

  # Test 3: Dry run option
  echo "  Testing renovate options..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -qE "(dry-run|config)"

  # Test 4: Binary exists
  echo "  Testing renovate binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/renovate" 2>&1 | grep -q "renovate"

  # Test 5: Git available
  echo "  Testing git available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "git --version" 2>&1 | grep -q "git version"

  echo "All renovate tests passed!"
''
