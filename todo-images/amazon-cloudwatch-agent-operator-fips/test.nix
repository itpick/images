{ pkgs, lib, ... }:

# TODO: Add tests for amazon-cloudwatch-agent-operator-fips image
{
  name = "amazon-cloudwatch-agent-operator-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-cloudwatch-agent-operator-fips"
    exit 1
  '';
}
