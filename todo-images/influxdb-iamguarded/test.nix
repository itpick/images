{ pkgs, lib, ... }:

# TODO: Add tests for influxdb-iamguarded image
{
  name = "influxdb-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for influxdb-iamguarded"
    exit 1
  '';
}
