{ pkgs, lib, ... }:

# TODO: Add tests for kubescape-operator image
{
  name = "kubescape-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kubescape-operator"
    exit 1
  '';
}
