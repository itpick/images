{ pkgs, lib, ... }:

# TODO: Add tests for crossplane-keycloak image
{
  name = "crossplane-keycloak";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for crossplane-keycloak"
    exit 1
  '';
}
