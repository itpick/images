{ pkgs, lib, ... }:

# TODO: Add tests for nats-server-config-reloader image
{
  name = "nats-server-config-reloader";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nats-server-config-reloader"
    exit 1
  '';
}
