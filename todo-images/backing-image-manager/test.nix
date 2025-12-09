{ pkgs, lib, ... }:

# TODO: Add tests for backing-image-manager image
{
  name = "backing-image-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for backing-image-manager"
    exit 1
  '';
}
