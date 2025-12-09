{ pkgs, lib, ... }:

# TODO: Add tests for amazon-cloudwatch-agent-operator image
{
  name = "amazon-cloudwatch-agent-operator";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for amazon-cloudwatch-agent-operator"
    exit 1
  '';
}
