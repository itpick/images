{ pkgs, lib, ... }:

# TODO: Add tests for keycloak-iamguarded image
{
  name = "keycloak-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keycloak-iamguarded"
    exit 1
  '';
}
