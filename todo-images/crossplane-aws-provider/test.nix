{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-provider image
{
  name = "crossplane-aws-provider";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-provider"
    exit 1
  '';
}
