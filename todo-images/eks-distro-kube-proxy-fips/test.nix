{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kube-proxy-fips image
{
  name = "eks-distro-kube-proxy-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kube-proxy-fips"
    exit 1
  '';
}
