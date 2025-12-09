{ pkgs, lib, ... }:

# TODO: Add tests for cluster-proportional-autoscaler image
{
  name = "cluster-proportional-autoscaler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-proportional-autoscaler"
    exit 1
  '';
}
