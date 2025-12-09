{ pkgs, lib, ... }:

# TODO: Add tests for heartbeat-fips image
{
  name = "heartbeat-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for heartbeat-fips"
    exit 1
  '';
}
