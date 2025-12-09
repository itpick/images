{ pkgs, lib, ... }:

# TODO: Add tests for selenium-event-bus image
{
  name = "selenium-event-bus";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for selenium-event-bus"
    exit 1
  '';
}
