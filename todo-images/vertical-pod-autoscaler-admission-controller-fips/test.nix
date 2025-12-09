{ pkgs, lib, ... }:

# TODO: Add tests for vertical-pod-autoscaler-admission-controller-fips image
{
  name = "vertical-pod-autoscaler-admission-controller-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vertical-pod-autoscaler-admission-controller-fips"
    exit 1
  '';
}
