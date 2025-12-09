{ pkgs, lib, ... }:

# TODO: Add tests for keycloak-operator image
{
  name = "keycloak-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for keycloak-operator"
    exit 1
  '';
}
