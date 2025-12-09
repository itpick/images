{ pkgs, lib, ... }:

# TODO: Add tests for livekit-server-fips image
{
  name = "livekit-server-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for livekit-server-fips"
    exit 1
  '';
}
