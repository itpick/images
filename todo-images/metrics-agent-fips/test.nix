{ pkgs, lib, ... }:

# TODO: Add tests for metrics-agent-fips image
{
  name = "metrics-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metrics-agent-fips"
    exit 1
  '';
}
