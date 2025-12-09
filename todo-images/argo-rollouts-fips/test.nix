{ pkgs, lib, ... }:

# TODO: Add tests for argo-rollouts-fips image
{
  name = "argo-rollouts-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-rollouts-fips"
    exit 1
  '';
}
