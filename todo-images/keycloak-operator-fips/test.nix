{ pkgs, lib, ... }:

# TODO: Add tests for keycloak-operator-fips image
{
  name = "keycloak-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keycloak-operator-fips"
    exit 1
  '';
}
