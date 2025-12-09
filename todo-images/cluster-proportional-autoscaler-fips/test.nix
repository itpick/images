{ pkgs, lib, ... }:

# TODO: Add tests for cluster-proportional-autoscaler-fips image
{
  name = "cluster-proportional-autoscaler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-proportional-autoscaler-fips"
    exit 1
  '';
}
