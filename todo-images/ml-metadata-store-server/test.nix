{ pkgs, lib, ... }:

# TODO: Add tests for ml-metadata-store-server image
{
  name = "ml-metadata-store-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for ml-metadata-store-server"
    exit 1
  '';
}
