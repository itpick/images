{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kube-apiserver image
{
  name = "eks-distro-kube-apiserver";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kube-apiserver"
    exit 1
  '';
}
