{ pkgs, lib, ... }:

# TODO: Add tests for liquibase image
{
  name = "liquibase";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for liquibase"
    exit 1
  '';
}
