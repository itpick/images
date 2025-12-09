{ pkgs, lib, ... }:

# TODO: Add tests for argo-workflowcontroller-fips image
{
  name = "argo-workflowcontroller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for argo-workflowcontroller-fips"
    exit 1
  '';
}
