{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kube-controller-manager-fips image
{
  name = "eks-distro-kube-controller-manager-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kube-controller-manager-fips"
    exit 1
  '';
}
