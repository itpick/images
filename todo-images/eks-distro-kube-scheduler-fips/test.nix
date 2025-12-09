{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-kube-scheduler-fips image
{
  name = "eks-distro-kube-scheduler-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-kube-scheduler-fips"
    exit 1
  '';
}
