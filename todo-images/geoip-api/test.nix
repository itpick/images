{ pkgs, lib, ... }:

# TODO: Add tests for geoip-api image
{
  name = "geoip-api";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for geoip-api"
    exit 1
  '';
}
