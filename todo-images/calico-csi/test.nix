{ pkgs, lib, ... }:

# TODO: Add tests for calico-csi image
{
  name = "calico-csi";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-csi"
    exit 1
  '';
}
