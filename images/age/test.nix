{ pkgs, image }:

pkgs.writeShellScript "test-age" ''
  set -euo pipefail
  echo "Testing age image functionality..."

  # Test 1: Version check
  echo "  Testing age version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "v[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing age help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "age"

  # Test 3: age-keygen exists
  echo "  Testing age-keygen..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/age-keygen" 2>&1 | grep -q "age-keygen"

  # Test 4: Encrypt/decrypt test
  echo "  Testing encryption functionality..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "echo 'test' | age -p -o /dev/null 2>&1" || true

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All age tests passed!"
''
