{ pkgs, lib, ... }:

# TODO: Add tests for kubewatch image
{
  name = "kubewatch";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubewatch"
    exit 1
  '';
}
