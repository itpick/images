{ pkgs, lib, ... }:

# TODO: Add tests for custom-pod-autoscaler-operator image
{
  name = "custom-pod-autoscaler-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for custom-pod-autoscaler-operator"
    exit 1
  '';
}
