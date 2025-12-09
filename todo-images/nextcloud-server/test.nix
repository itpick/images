{ pkgs, lib, ... }:

# TODO: Add tests for nextcloud-server image
{
  name = "nextcloud-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nextcloud-server"
    exit 1
  '';
}
