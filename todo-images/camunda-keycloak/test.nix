{ pkgs, lib, ... }:

# TODO: Add tests for camunda-keycloak image
{
  name = "camunda-keycloak";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for camunda-keycloak"
    exit 1
  '';
}
