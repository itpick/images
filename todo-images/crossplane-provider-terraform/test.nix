{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-provider-terraform image
{
  name = "crossplane-provider-terraform";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-provider-terraform"
    exit 1
  '';
}
