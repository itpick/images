{ pkgs, lib, ... }:

# TODO: Add tests for selenium-standalone-firefox image
{
  name = "selenium-standalone-firefox";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-standalone-firefox"
    exit 1
  '';
}
