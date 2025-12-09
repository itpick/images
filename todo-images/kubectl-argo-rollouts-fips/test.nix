{ pkgs, lib, ... }:

# TODO: Add tests for kubectl-argo-rollouts-fips image
{
  name = "kubectl-argo-rollouts-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubectl-argo-rollouts-fips"
    exit 1
  '';
}
