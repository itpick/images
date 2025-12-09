{ pkgs, lib, ... }:

# TODO: Add tests for selenium-router image
{
  name = "selenium-router";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-router"
    exit 1
  '';
}
