{ pkgs, lib, ... }:

# TODO: Add tests for cluster-autoscaler-fips image
{
  name = "cluster-autoscaler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-autoscaler-fips"
    exit 1
  '';
}
