{ pkgs, lib, ... }:

# TODO: Add tests for aws-eks-pod-identity-agent-fips image
{
  name = "aws-eks-pod-identity-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-eks-pod-identity-agent-fips"
    exit 1
  '';
}
