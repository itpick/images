{ pkgs, lib, ... }:

# TODO: Add tests for selenium-node-docker image
{
  name = "selenium-node-docker";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-node-docker"
    exit 1
  '';
}
