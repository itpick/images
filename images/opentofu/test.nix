{ pkgs, image }:

pkgs.writeShellScript "test-opentofu" ''
  set -euo pipefail
  echo "Testing opentofu image functionality..."

  # Test 1: Version check
  echo "  Testing tofu version..."
  docker run --rm --entrypoint tofu ${image.imageName}:test version 2>&1 | grep -qE "OpenTofu v[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing tofu help..."
  docker run --rm ${image.imageName}:test 2>&1 | grep -q "tofu"

  # Test 3: Init subcommand help
  echo "  Testing tofu init help..."
  docker run --rm --entrypoint tofu ${image.imageName}:test init --help 2>&1 | grep -q "init"

  # Test 4: Binary exists
  echo "  Testing tofu binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/tofu" 2>&1 | grep -q "tofu"

  # Test 5: Git available
  echo "  Testing git available..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "git --version" 2>&1 | grep -q "git version"

  echo "All opentofu tests passed!"
''
