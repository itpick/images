{ pkgs, lib, ... }:

# TODO: Add tests for graphicsmagick image
{
  name = "graphicsmagick";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for graphicsmagick"
    exit 1
  '';
}
