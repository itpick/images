{ pkgs, lib, ... }:

# TODO: Add tests for kibana-fips image
{
  name = "kibana-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kibana-fips"
    exit 1
  '';
}
