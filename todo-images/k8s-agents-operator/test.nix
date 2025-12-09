{ pkgs, lib, ... }:

# TODO: Add tests for k8s-agents-operator image
{
  name = "k8s-agents-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for k8s-agents-operator"
    exit 1
  '';
}
