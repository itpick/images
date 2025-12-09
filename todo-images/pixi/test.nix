{ pkgs, lib, ... }:

# TODO: Add tests for pixi image
{
  name = "pixi";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pixi"
    exit 1
  '';
}
