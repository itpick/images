{ pkgs, image }:

pkgs.writeShellScript "test-kubectl-argo-rollouts" ''
  set -euo pipefail
  echo "Testing kubectl-argo-rollouts image..."

  # 1. Entrypoint runs --help (exit 0, non-empty output)
  echo "  Checking kubectl-argo-rollouts --help..."
  out=$(docker run --rm ${image.imageName}:test --help 2>&1)
  [ -n "$out" ]

  # 2. Binary is present in the image
  echo "  Checking kubectl-argo-rollouts is present..."
  docker run --rm --entrypoint /bin/sh ${image.imageName}:test -c 'command -v kubectl-argo-rollouts >/dev/null 2>&1 || ls /nix/store/*/bin/kubectl-argo-rollouts >/dev/null 2>&1'

  echo "All kubectl-argo-rollouts tests passed!"
''
