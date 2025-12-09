{ pkgs, lib, ... }:

# TODO: Add tests for nats image
{
  name = "nats";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for nats"
    exit 1
  '';
}
