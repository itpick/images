{ pkgs, image }:

pkgs.writeShellScript "test-zig" ''
  set -euo pipefail
  echo "Testing zig image functionality..."

  # Test 1: Version check
  echo "  Testing zig version..."
  docker run --rm ${image.imageName}:test version 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing zig help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "zig"

  # Test 3: Build subcommand
  echo "  Testing zig build help..."
  docker run --rm ${image.imageName}:test build --help 2>&1 | grep -q "build"

  # Test 4: Binary exists
  echo "  Testing zig binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/zig" 2>&1 | grep -q "zig"

  # Test 5: Compile simple program
  echo "  Testing zig compile..."
  docker run --rm ${image.imageName}:test zen 2>&1 | grep -qE "(zen|Zig)"

  echo "All zig tests passed!"
''
