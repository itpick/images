{ pkgs, lib, ... }:

# TODO: Add tests for datadog-agent-fips image
{
  name = "datadog-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for datadog-agent-fips"
    exit 1
  '';
}
