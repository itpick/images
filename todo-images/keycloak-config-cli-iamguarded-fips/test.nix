{ pkgs, lib, ... }:

# TODO: Add tests for keycloak-config-cli-iamguarded-fips image
{
  name = "keycloak-config-cli-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keycloak-config-cli-iamguarded-fips"
    exit 1
  '';
}
