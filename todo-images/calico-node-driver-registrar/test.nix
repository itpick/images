{ pkgs, lib, ... }:

# TODO: Add tests for calico-node-driver-registrar image
{
  name = "calico-node-driver-registrar";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-node-driver-registrar"
    exit 1
  '';
}
