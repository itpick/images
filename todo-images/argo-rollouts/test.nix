{ pkgs, lib, ... }:

# TODO: Add tests for argo-rollouts image
{
  name = "argo-rollouts";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-rollouts"
    exit 1
  '';
}
