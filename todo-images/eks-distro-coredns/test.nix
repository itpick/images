{ pkgs, lib, ... }:

# TODO: Add tests for eks-distro-coredns image
{
  name = "eks-distro-coredns";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for eks-distro-coredns"
    exit 1
  '';
}
