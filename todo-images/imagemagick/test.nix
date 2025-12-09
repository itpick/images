{ pkgs, lib, ... }:

# TODO: Add tests for imagemagick image
{
  name = "imagemagick";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for imagemagick"
    exit 1
  '';
}
