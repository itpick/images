{ pkgs, lib, ... }:

# TODO: Add tests for thingsboard-tb-mqtt-transport image
{
  name = "thingsboard-tb-mqtt-transport";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for thingsboard-tb-mqtt-transport"
    exit 1
  '';
}
