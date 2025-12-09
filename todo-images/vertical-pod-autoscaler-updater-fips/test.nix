{ pkgs, lib, ... }:

# TODO: Add tests for vertical-pod-autoscaler-updater-fips image
{
  name = "vertical-pod-autoscaler-updater-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vertical-pod-autoscaler-updater-fips"
    exit 1
  '';
}
