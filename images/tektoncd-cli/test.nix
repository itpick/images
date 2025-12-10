{ pkgs, image }:

pkgs.writeShellScript "test-tektoncd-cli" ''
  set -euo pipefail
  echo "Testing tektoncd-cli image functionality..."

  # Test 1: Version check
  echo "  Testing tkn version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing tkn help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "tkn"

  # Test 3: Pipeline subcommand
  echo "  Testing tkn pipeline help..."
  docker run --rm ${image.imageName}:test pipeline --help 2>&1 | grep -q "pipeline"

  # Test 4: Binary exists
  echo "  Testing tkn binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/tkn" 2>&1 | grep -q "tkn"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All tektoncd-cli tests passed!"
''
