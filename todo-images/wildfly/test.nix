{ pkgs, lib, ... }:

# TODO: Add tests for wildfly image
{
  name = "wildfly";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for wildfly"
    exit 1
  '';
}
