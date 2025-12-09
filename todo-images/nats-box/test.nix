{ pkgs, lib, ... }:

# TODO: Add tests for nats-box image
{
  name = "nats-box";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nats-box"
    exit 1
  '';
}
