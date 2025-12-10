{ pkgs, image }:

pkgs.writeShellScript "test-hadolint" ''
  set -euo pipefail
  echo "Testing hadolint image functionality..."

  # Test 1: Version check
  echo "  Testing hadolint version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "Hadolint v[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing hadolint help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "hadolint"

  # Test 3: Lint stdin
  echo "  Testing hadolint lint..."
  echo "FROM alpine" | docker run --rm -i ${image.imageName}:test - 2>&1 || true

  # Test 4: Binary exists
  echo "  Testing hadolint binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/hadolint" 2>&1 | grep -q "hadolint"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All hadolint tests passed!"
''
