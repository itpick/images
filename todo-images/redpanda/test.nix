{ pkgs, lib, ... }:

# TODO: Add tests for redpanda image
{
  name = "redpanda";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for redpanda"
    exit 1
  '';
}
