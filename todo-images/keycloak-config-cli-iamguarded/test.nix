{ pkgs, lib, ... }:

# TODO: Add tests for keycloak-config-cli-iamguarded image
{
  name = "keycloak-config-cli-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keycloak-config-cli-iamguarded"
    exit 1
  '';
}
