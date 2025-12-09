{ pkgs, lib, ... }:

# TODO: Add tests for aws-network-policy-agent image
{
  name = "aws-network-policy-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-network-policy-agent"
    exit 1
  '';
}
