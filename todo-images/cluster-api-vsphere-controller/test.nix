{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-vsphere-controller image
{
  name = "cluster-api-vsphere-controller";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-vsphere-controller"
    exit 1
  '';
}
