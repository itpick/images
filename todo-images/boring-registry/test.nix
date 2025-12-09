{ pkgs, lib, ... }:

# TODO: Add tests for boring-registry image
{
  name = "boring-registry";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for boring-registry"
    exit 1
  '';
}
