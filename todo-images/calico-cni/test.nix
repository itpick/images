{ pkgs, lib, ... }:

# TODO: Add tests for calico-cni image
{
  name = "calico-cni";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-cni"
    exit 1
  '';
}
