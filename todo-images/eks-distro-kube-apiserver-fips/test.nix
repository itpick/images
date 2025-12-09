{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kube-apiserver-fips image
{
  name = "eks-distro-kube-apiserver-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kube-apiserver-fips"
    exit 1
  '';
}
