{ pkgs, lib, ... }:

# TODO: Add tests for flannel-cni-plugin image
{
  name = "flannel-cni-plugin";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for flannel-cni-plugin"
    exit 1
  '';
}
