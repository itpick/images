{ pkgs, lib, ... }:

# TODO: Add tests for kubectl-argo-rollouts image
{
  name = "kubectl-argo-rollouts";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubectl-argo-rollouts"
    exit 1
  '';
}
