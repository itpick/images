{ pkgs, lib, ... }:

# TODO: Add tests for datadog-cluster-agent image
{
  name = "datadog-cluster-agent";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for datadog-cluster-agent"
    exit 1
  '';
}
