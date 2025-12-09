{ pkgs, lib, ... }:

# TODO: Add tests for amazon-k8s-cni-init image
{
  name = "amazon-k8s-cni-init";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-k8s-cni-init"
    exit 1
  '';
}
