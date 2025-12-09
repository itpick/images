{ pkgs, lib, ... }:

# TODO: Add tests for selenium-node-chromium image
{
  name = "selenium-node-chromium";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-node-chromium"
    exit 1
  '';
}
