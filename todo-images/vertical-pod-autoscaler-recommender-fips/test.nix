{ pkgs, lib, ... }:

# TODO: Add tests for vertical-pod-autoscaler-recommender-fips image
{
  name = "vertical-pod-autoscaler-recommender-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for vertical-pod-autoscaler-recommender-fips"
    exit 1
  '';
}
