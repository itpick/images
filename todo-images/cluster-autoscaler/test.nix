{ pkgs, lib, ... }:

# TODO: Add tests for cluster-autoscaler image
{
  name = "cluster-autoscaler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cluster-autoscaler"
    exit 1
  '';
}
