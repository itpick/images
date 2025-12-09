{ pkgs, lib, ... }:

# TODO: Add tests for datadog-cluster-agent-fips image
{
  name = "datadog-cluster-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for datadog-cluster-agent-fips"
    exit 1
  '';
}
