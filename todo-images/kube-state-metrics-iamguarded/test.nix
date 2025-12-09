{ pkgs, lib, ... }:

# TODO: Add tests for kube-state-metrics-iamguarded image
{
  name = "kube-state-metrics-iamguarded";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kube-state-metrics-iamguarded"
    exit 1
  '';
}
