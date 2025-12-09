{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-vsphere-controller-fips image
{
  name = "cluster-api-vsphere-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-vsphere-controller-fips"
    exit 1
  '';
}
