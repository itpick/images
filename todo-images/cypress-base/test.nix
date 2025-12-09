{ pkgs, lib, ... }:

# TODO: Add tests for cypress-base image
{
  name = "cypress-base";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cypress-base"
    exit 1
  '';
}
