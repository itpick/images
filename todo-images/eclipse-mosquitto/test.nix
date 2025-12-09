{ pkgs, lib, ... }:

# TODO: Add tests for eclipse-mosquitto image
{
  name = "eclipse-mosquitto";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eclipse-mosquitto"
    exit 1
  '';
}
