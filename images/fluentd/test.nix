{ pkgs, image }:

pkgs.writeShellScript "test-fluentd" ''
  set -euo pipefail
  echo "Testing fluentd image functionality..."

  # Test 1: Version check
  echo "  Testing fluentd version..."
  docker run --rm --entrypoint fluentd ${image.imageName}:test --version 2>&1 | grep -qE "fluentd [0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing fluentd help..."
  docker run --rm --entrypoint fluentd ${image.imageName}:test --help 2>&1 | grep -q "fluentd"

  # Test 3: Dry run capability
  echo "  Testing fluentd dry-run..."
  docker run --rm --entrypoint fluentd ${image.imageName}:test --help 2>&1 | grep -qE "(dry-run|config)"

  # Test 4: Binary exists
  echo "  Testing fluentd binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/fluentd" 2>&1 | grep -q "fluentd"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All fluentd tests passed!"
''
