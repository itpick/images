{ pkgs, lib, ... }:

# TODO: Add tests for keycloak-fips image
{
  name = "keycloak-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keycloak-fips"
    exit 1
  '';
}
