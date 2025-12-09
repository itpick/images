{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kube-proxy image
{
  name = "eks-distro-kube-proxy";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kube-proxy"
    exit 1
  '';
}
