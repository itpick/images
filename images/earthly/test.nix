{ pkgs, image }:

pkgs.writeShellScript "test-earthly" ''
  set -euo pipefail
  echo "Testing earthly image functionality..."

  # Test 1: Version check
  echo "  Testing earthly version..."
  docker run --rm ${image.imageName}:test --version 2>&1 | grep -qE "earthly version v[0-9]+"

  # Test 2: Help output
  echo "  Testing earthly help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "earthly"

  # Test 3: Build subcommand
  echo "  Testing earthly build help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -q "build"

  # Test 4: Binary exists
  echo "  Testing earthly binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/earthly" 2>&1 | grep -q "earthly"

  # Test 5: Git available
  echo "  Testing git available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "git --version" 2>&1 | grep -q "git version"

  echo "All earthly tests passed!"
''
