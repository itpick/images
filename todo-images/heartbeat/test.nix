{ pkgs, lib, ... }:

# TODO: Add tests for heartbeat image
{
  name = "heartbeat";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for heartbeat"
    exit 1
  '';
}
