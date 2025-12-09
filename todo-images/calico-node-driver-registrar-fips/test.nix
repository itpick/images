{ pkgs, lib, ... }:

# TODO: Add tests for calico-node-driver-registrar-fips image
{
  name = "calico-node-driver-registrar-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for calico-node-driver-registrar-fips"
    exit 1
  '';
}
