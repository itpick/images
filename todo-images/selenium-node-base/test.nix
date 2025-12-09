{ pkgs, lib, ... }:

# TODO: Add tests for selenium-node-base image
{
  name = "selenium-node-base";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-node-base"
    exit 1
  '';
}
