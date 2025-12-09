{ pkgs, lib, ... }:

# TODO: Add tests for linkerd-cni-plugin image
{
  name = "linkerd-cni-plugin";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for linkerd-cni-plugin"
    exit 1
  '';
}
