{ pkgs, lib, ... }:

# TODO: Add tests for elastic-agent-fips image
{
  name = "elastic-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for elastic-agent-fips"
    exit 1
  '';
}
