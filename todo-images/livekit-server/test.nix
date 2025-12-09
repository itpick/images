{ pkgs, lib, ... }:

# TODO: Add tests for livekit-server image
{
  name = "livekit-server";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for livekit-server"
    exit 1
  '';
}
