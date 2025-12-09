{ pkgs, lib, ... }:

# TODO: Add tests for portieris image
{
  name = "portieris";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for portieris"
    exit 1
  '';
}
