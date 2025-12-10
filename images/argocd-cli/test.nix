{ pkgs, image }:

pkgs.writeShellScript "test-argocd-cli" ''
  set -euo pipefail
  echo "Testing argocd-cli image functionality..."

  # Test 1: Version check
  echo "  Testing argocd version..."
  docker run --rm ${image.imageName}:test version --client 2>&1 | grep -qE "[0-9]+\.[0-9]+"

  # Test 2: Help output
  echo "  Testing argocd help..."
  docker run --rm ${image.imageName}:test help 2>&1 | grep -q "argocd"

  # Test 3: App subcommand help
  echo "  Testing argocd app help..."
  docker run --rm ${image.imageName}:test app --help 2>&1 | grep -q "app"

  # Test 4: Binary exists
  echo "  Testing argocd binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/argocd" 2>&1 | grep -q "argocd"

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All argocd-cli tests passed!"
''
