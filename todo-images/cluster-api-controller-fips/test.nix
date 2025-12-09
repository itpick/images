{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-controller-fips image
{
  name = "cluster-api-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-controller-fips"
    exit 1
  '';
}
