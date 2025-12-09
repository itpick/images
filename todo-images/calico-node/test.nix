{ pkgs, lib, ... }:

# TODO: Add tests for calico-node image
{
  name = "calico-node";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-node"
    exit 1
  '';
}
