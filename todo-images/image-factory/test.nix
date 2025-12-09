{ pkgs, lib, ... }:

# TODO: Add tests for image-factory image
{
  name = "image-factory";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for image-factory"
    exit 1
  '';
}
