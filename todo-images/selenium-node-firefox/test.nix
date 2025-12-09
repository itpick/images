{ pkgs, lib, ... }:

# TODO: Add tests for selenium-node-firefox image
{
  name = "selenium-node-firefox";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-node-firefox"
    exit 1
  '';
}
