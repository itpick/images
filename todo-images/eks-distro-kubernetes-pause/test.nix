{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kubernetes-pause image
{
  name = "eks-distro-kubernetes-pause";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kubernetes-pause"
    exit 1
  '';
}
