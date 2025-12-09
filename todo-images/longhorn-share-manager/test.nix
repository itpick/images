{ pkgs, lib, ... }:

# TODO: Add tests for longhorn-share-manager image
{
  name = "longhorn-share-manager";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for longhorn-share-manager"
    exit 1
  '';
}
