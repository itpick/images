{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-provider-kubernetes-fips image
{
  name = "crossplane-provider-kubernetes-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-provider-kubernetes-fips"
    exit 1
  '';
}
