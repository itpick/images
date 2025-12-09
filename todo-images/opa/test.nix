{ pkgs, lib, ... }:

# TODO: Add tests for opa image
{
  name = "opa";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for opa"
    exit 1
  '';
}
