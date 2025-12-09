{ pkgs, lib, ... }:

# TODO: Add tests for amazon-cloudwatch-agent-fips image
{
  name = "amazon-cloudwatch-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-cloudwatch-agent-fips"
    exit 1
  '';
}
