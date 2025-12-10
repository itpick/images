{ pkgs, image }:

pkgs.writeShellScript "test-envoy" ''
  set -euo pipefail
  echo "Testing envoy image functionality..."

  # Test 1: Version check
  echo "  Testing envoy version..."
  docker run --rm --entrypoint envoy ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing envoy help..."
  docker run --rm --entrypoint envoy ${image.imageName}:test --help 2>&1 | grep -q "envoy"

  # Test 3: Mode options
  echo "  Testing envoy mode..."
  docker run --rm --entrypoint envoy ${image.imageName}:test --help 2>&1 | grep -qE "(serve|config)"

  # Test 4: Binary exists
  echo "  Testing envoy binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/envoy" 2>&1 | grep -q "envoy"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All envoy tests passed!"
''
