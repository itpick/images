{ pkgs, lib, ... }:

# TODO: Add tests for blob-csi image
{
  name = "blob-csi";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for blob-csi"
    exit 1
  '';
}
