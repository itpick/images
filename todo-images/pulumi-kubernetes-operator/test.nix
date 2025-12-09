{ pkgs, lib, ... }:

# TODO: Add tests for pulumi-kubernetes-operator image
{
  name = "pulumi-kubernetes-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for pulumi-kubernetes-operator"
    exit 1
  '';
}
