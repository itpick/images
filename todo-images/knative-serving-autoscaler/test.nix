{ pkgs, lib, ... }:

# TODO: Add tests for knative-serving-autoscaler image
{
  name = "knative-serving-autoscaler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for knative-serving-autoscaler"
    exit 1
  '';
}
