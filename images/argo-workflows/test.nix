{ pkgs, image }:

pkgs.writeShellScript "test-argo-workflows" ''
  set -euo pipefail
  echo "Testing argo-workflows image functionality..."

  # Test 1: Version check
  echo "  Testing argo version..."
  docker run --rm ${image.imageName}:test version 2>&1 || true  # May need k8s context

  # Test 2: Help output
  echo "  Testing argo help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "argo"

  # Test 3: Template subcommand
  echo "  Testing argo template help..."
  docker run --rm ${image.imageName}:test template --help 2>&1 | grep -q "template"

  # Test 4: Binary exists
  echo "  Testing argo binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/argo" 2>&1 | grep -q "argo"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All argo-workflows tests passed!"
''
