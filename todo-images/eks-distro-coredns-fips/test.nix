{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-coredns-fips image
{
  name = "eks-distro-coredns-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-coredns-fips"
    exit 1
  '';
}
