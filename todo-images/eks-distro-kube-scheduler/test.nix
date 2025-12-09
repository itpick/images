{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kube-scheduler image
{
  name = "eks-distro-kube-scheduler";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kube-scheduler"
    exit 1
  '';
}
