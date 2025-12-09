{ pkgs, lib, ... }:

# TODO: Add tests for datadog-agent image
{
  name = "datadog-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for datadog-agent"
    exit 1
  '';
}
