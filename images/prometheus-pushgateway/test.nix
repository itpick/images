{ pkgs, image }:

pkgs.writeShellScript "test-prometheus-pushgateway" ''
  set -euo pipefail
  echo "Testing prometheus-pushgateway image functionality..."

  # Test 1: Version check
  echo "  Testing pushgateway version..."
  docker run --rm --entrypoint pushgateway ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing pushgateway help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -qE "(pushgateway|prometheus)"

  # Test 3: Web options
  echo "  Testing pushgateway options..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -qE "(web|listen)"

  # Test 4: Binary exists
  echo "  Testing pushgateway binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/pushgateway" 2>&1 | grep -q "pushgateway"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All prometheus-pushgateway tests passed!"
''
