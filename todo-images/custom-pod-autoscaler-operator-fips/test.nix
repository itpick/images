{ pkgs, lib, ... }:

# TODO: Add tests for custom-pod-autoscaler-operator-fips image
{
  name = "custom-pod-autoscaler-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for custom-pod-autoscaler-operator-fips"
    exit 1
  '';
}
