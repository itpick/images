{ pkgs, lib, ... }:

# TODO: Add tests for spire-oidc-discovery-provider-fips image
{
  name = "spire-oidc-discovery-provider-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for spire-oidc-discovery-provider-fips"
    exit 1
  '';
}
