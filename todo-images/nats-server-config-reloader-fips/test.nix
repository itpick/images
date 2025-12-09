{ pkgs, lib, ... }:

# TODO: Add tests for nats-server-config-reloader-fips image
{
  name = "nats-server-config-reloader-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nats-server-config-reloader-fips"
    exit 1
  '';
}
