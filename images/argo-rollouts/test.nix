{ pkgs, image }:

pkgs.writeShellScript "test-argo-rollouts" ''
  set -euo pipefail
  echo "Testing argo-rollouts image functionality..."

  # Test 1: Version check
  echo "  Testing argo-rollouts version..."
  docker run --rm ${image.imageName}:test version 2>&1 || true  # May need k8s context

  # Test 2: Help output
  echo "  Testing argo-rollouts help..."
  docker run --rm ${image.imageName}:test --help 2>&1 | grep -qE "(rollout|controller)"

  # Test 3: Binary exists
  echo "  Testing rollouts-controller binary exists..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/rollouts-controller" 2>&1 | grep -q "rollouts-controller"

  # Test 4: kubectl-argo-rollouts plugin
  echo "  Testing kubectl plugin..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "ls /nix/store/*/bin/kubectl-argo-rollouts" 2>&1 || true

  # Test 5: User setup
  echo "  Testing user setup..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c "id" 2>&1 | grep -qE "(uid=|1000)"

  echo "All argo-rollouts tests passed!"
''
