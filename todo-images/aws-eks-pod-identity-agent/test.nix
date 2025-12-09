{ pkgs, lib, ... }:

# TODO: Add tests for aws-eks-pod-identity-agent image
{
  name = "aws-eks-pod-identity-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-eks-pod-identity-agent"
    exit 1
  '';
}
