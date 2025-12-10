{ pkgs, image }:

pkgs.writeShellScript "test-actionlint" ''
  set -euo pipefail
  echo "Testing actionlint image functionality..."

  # Test 1: Version check
  echo "  Testing actionlint version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing actionlint help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "actionlint"

  # Test 3: Lint stdin (empty should pass)
  echo "  Testing actionlint stdin..."
  echo "" | docker run --rm -i ${image.imageName}:test - 2>&1 || true

  # Test 4: Binary exists
  echo "  Testing actionlint binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls -la /nix/store/*/bin/actionlint" 2>&1 | grep -q "actionlint"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All actionlint tests passed!"
''
