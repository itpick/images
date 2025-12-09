{ pkgs, lib, ... }:

# TODO: Add tests for amazon-k8s-cni image
{
  name = "amazon-k8s-cni";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-k8s-cni"
    exit 1
  '';
}
