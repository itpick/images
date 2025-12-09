{ pkgs, lib, ... }:

# TODO: Add tests for cilium-hubble-relay image
{
  name = "cilium-hubble-relay";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-hubble-relay"
    exit 1
  '';
}
