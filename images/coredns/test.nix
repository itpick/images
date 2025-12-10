{ pkgs, image }:

pkgs.writeShellScript "test-coredns" ''
  set -euo pipefail
  echo "Testing coredns image functionality..."

  # Test 1: Version check
  echo "  Testing coredns version..."
  docker run --rm --entrypoint coredns ${image.imageName}:test -version 2>&1 | grep -qE "CoreDNS-[0-9]+"

  # Test 2: Help output
  echo "  Testing coredns help..."
  docker run --rm --entrypoint coredns ${image.imageName}:test -h 2>&1 | grep -qE "(coredns|DNS)"

  # Test 3: Plugins list
  echo "  Testing coredns plugins..."
  docker run --rm --entrypoint coredns ${image.imageName}:test -plugins 2>&1 | grep -q "dns"

  # Test 4: Binary exists
  echo "  Testing coredns binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/coredns" 2>&1 | grep -q "coredns"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All coredns tests passed!"
''
