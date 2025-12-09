{ pkgs, lib, ... }:

# TODO: Add tests for calico-key-cert-provisioner-fips image
{
  name = "calico-key-cert-provisioner-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-key-cert-provisioner-fips"
    exit 1
  '';
}
