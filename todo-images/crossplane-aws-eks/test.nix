{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-eks image
{
  name = "crossplane-aws-eks";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-eks"
    exit 1
  '';
}
