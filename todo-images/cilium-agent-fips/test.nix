{ pkgs, lib, ... }:

# TODO: Add tests for cilium-agent-fips image
{
  name = "cilium-agent-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for cilium-agent-fips"
    exit 1
  '';
}
