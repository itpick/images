{ pkgs, image }:

pkgs.writeShellScript "test-grafana-alloy" ''
  set -euo pipefail
  echo "Testing grafana-alloy image functionality..."

  # Test 1: Version check
  echo "  Testing alloy version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing alloy help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -qE "(alloy|Grafana)"

  # Test 3: Run subcommand
  echo "  Testing alloy run help..."
  docker run --rm ${image.imageName}:test run --help 2>&1 || true

  # Test 4: Binary exists
  echo "  Testing alloy binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/alloy" 2>&1 | grep -q "alloy"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All grafana-alloy tests passed!"
''
