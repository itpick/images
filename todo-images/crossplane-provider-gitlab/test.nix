{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-provider-gitlab image
{
  name = "crossplane-provider-gitlab";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-provider-gitlab"
    exit 1
  '';
}
