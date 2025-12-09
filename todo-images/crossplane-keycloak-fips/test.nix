{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-keycloak-fips image
{
  name = "crossplane-keycloak-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-keycloak-fips"
    exit 1
  '';
}
