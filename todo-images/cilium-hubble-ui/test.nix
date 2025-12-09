{ pkgs, lib, ... }:

# TODO: Add tests for cilium-hubble-ui image
{
  name = "cilium-hubble-ui";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-hubble-ui"
    exit 1
  '';
}
