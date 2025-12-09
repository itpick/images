{ pkgs, lib, ... }:

# TODO: Add tests for cluster-api-clusterctl-fips image
{
  name = "cluster-api-clusterctl-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-api-clusterctl-fips"
    exit 1
  '';
}
