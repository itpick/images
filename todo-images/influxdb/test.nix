{ pkgs, lib, ... }:

# TODO: Add tests for influxdb image
{
  name = "influxdb";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for influxdb"
    exit 1
  '';
}
