{ pkgs, image }:

pkgs.writeShellScript "test-semgrep" ''
  set -euo pipefail
  echo "Testing semgrep image functionality..."

  # Test 1: Version check
  echo "  Testing semgrep version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing semgrep help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -q "semgrep"

  # Test 3: Scan subcommand
  echo "  Testing semgrep scan help..."
  docker run --rm ${image.imageName}:test scan --help 2>&1 | grep -q "scan"

  # Test 4: Binary exists
  echo "  Testing semgrep binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/semgrep" 2>&1 | grep -q "semgrep"

  # Test 5: Git available
  echo "  Testing git available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "git --version" 2>&1 | grep -q "git version"

  echo "All semgrep tests passed!"
''
