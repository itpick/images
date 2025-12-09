{ pkgs, lib, ... }:

# TODO: Add tests for openscap image
{
  name = "openscap";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for openscap"
    exit 1
  '';
}
