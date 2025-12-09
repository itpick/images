{ pkgs, lib, ... }:

# TODO: Add tests for vertical-pod-autoscaler-fips image
{
  name = "vertical-pod-autoscaler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vertical-pod-autoscaler-fips"
    exit 1
  '';
}
