{ pkgs, lib, ... }:

# TODO: Add tests for keycloak-iamguarded-fips image
{
  name = "keycloak-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keycloak-iamguarded-fips"
    exit 1
  '';
}
