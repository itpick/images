{ pkgs, lib, ... }:

# TODO: Add tests for aws-network-policy-agent-fips image
{
  name = "aws-network-policy-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for aws-network-policy-agent-fips"
    exit 1
  '';
}
