{ pkgs, lib, ... }:

# TODO: Add tests for geoserver image
{
  name = "geoserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for geoserver"
    exit 1
  '';
}
