{ pkgs, lib, ... }:

# TODO: Add tests for filebrowser image
{
  name = "filebrowser";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for filebrowser"
    exit 1
  '';
}
