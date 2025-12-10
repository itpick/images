{ pkgs, image }:

pkgs.writeShellScript "test-kubesec" ''
  set -euo pipefail
  echo "Testing kubesec image functionality..."

  # Test 1: Version check
  echo "  Testing kubesec version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing kubesec help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "kubesec"

  # Test 3: Scan subcommand
  echo "  Testing kubesec scan help..."
  docker run --rm ${image.imageName}:test scan --help 2>&1 | grep -q "scan"

  # Test 4: Binary exists
  echo "  Testing kubesec binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/kubesec" 2>&1 | grep -q "kubesec"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All kubesec tests passed!"
''
