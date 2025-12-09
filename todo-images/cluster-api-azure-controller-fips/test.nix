{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-azure-controller-fips image
{
  name = "cluster-api-azure-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-azure-controller-fips"
    exit 1
  '';
}
