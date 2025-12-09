{ pkgs, lib, ... }:

# TODO: Add tests for calico-key-cert-provisioner image
{
  name = "calico-key-cert-provisioner";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-key-cert-provisioner"
    exit 1
  '';
}
