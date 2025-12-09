{ pkgs, lib, ... }:

# TODO: Add tests for kubernetes-csi-node-driver-registrar-fips image
{
  name = "kubernetes-csi-node-driver-registrar-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubernetes-csi-node-driver-registrar-fips"
    exit 1
  '';
}
