{ pkgs, lib, ... }:

# TODO: Add tests for az image
{
  name = "az";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for az"
    exit 1
  '';
}
