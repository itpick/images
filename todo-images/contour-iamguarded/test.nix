{ pkgs, lib, ... }:

# TODO: Add tests for contour-iamguarded image
{
  name = "contour-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for contour-iamguarded"
    exit 1
  '';
}
