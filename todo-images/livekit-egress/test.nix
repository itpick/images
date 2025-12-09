{ pkgs, lib, ... }:

# TODO: Add tests for livekit-egress image
{
  name = "livekit-egress";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for livekit-egress"
    exit 1
  '';
}
