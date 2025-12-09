{ pkgs, lib, ... }:

# TODO: Add tests for amazon-cloudwatch-agent image
{
  name = "amazon-cloudwatch-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-cloudwatch-agent"
    exit 1
  '';
}
