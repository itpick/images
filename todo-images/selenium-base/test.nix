{ pkgs, lib, ... }:

# TODO: Add tests for selenium-base image
{
  name = "selenium-base";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-base"
    exit 1
  '';
}
