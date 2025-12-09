{ pkgs, lib, ... }:

# TODO: Add tests for cilium-hubble-ui-backend image
{
  name = "cilium-hubble-ui-backend";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-hubble-ui-backend"
    exit 1
  '';
}
