{ pkgs, lib, ... }:

# TODO: Add tests for camunda-keycloak-fips image
{
  name = "camunda-keycloak-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for camunda-keycloak-fips"
    exit 1
  '';
}
