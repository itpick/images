{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-aws-eks-fips image
{
  name = "crossplane-aws-eks-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-aws-eks-fips"
    exit 1
  '';
}
