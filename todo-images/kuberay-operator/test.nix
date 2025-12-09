{ pkgs, lib, ... }:

# TODO: Add tests for kuberay-operator image
{
  name = "kuberay-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kuberay-operator"
    exit 1
  '';
}
