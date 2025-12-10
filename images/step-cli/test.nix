{ pkgs, image }:

pkgs.writeShellScript "test-step-cli" ''
  set -euo pipefail
  echo "Testing step-cli image functionality..."

  # Test 1: Version check
  echo "  Testing step version..."
  docker run --rm --entrypoint step ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing step help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -q "step"

  # Test 3: Certificate subcommand
  echo "  Testing step certificate help..."
  docker run --rm --entrypoint step ${image.imageName}:test certificate --help 2>&1 | grep -q "certificate"

  # Test 4: Binary exists
  echo "  Testing step binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/step" 2>&1 | grep -q "step"

  # Test 5: CA certs available
  echo "  Testing CA certs available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /etc/ssl/certs" 2>&1 | grep -qE "(ca-|certs)"

  echo "All step-cli tests passed!"
''
