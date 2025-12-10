{ pkgs, image }:

pkgs.writeShellScript "test-step-ca" ''
  set -euo pipefail
  echo "Testing step-ca image functionality..."

  # Test 1: Version check
  echo "  Testing step-ca version..."
  docker run --rm --entrypoint step-ca ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing step-ca help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -qE "(step-ca|certificate)"

  # Test 3: Init subcommand
  echo "  Testing step-ca options..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -qE "(config|password)"

  # Test 4: Binary exists
  echo "  Testing step-ca binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/step-ca" 2>&1 | grep -q "step-ca"

  # Test 5: CA certs available
  echo "  Testing CA certs available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /etc/ssl/certs" 2>&1 | grep -qE "(ca-|certs)"

  echo "All step-ca tests passed!"
''
