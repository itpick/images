{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws image
{
  name = "crossplane-aws";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws"
    exit 1
  '';
}
