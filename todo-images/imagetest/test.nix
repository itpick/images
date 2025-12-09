{ pkgs, lib, ... }:

# TODO: Add tests for imagetest image
{
  name = "imagetest";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for imagetest"
    exit 1
  '';
}
