{ pkgs, lib, ... }:

# TODO: Add tests for kibana-iamguarded-fips image
{
  name = "kibana-iamguarded-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for kibana-iamguarded-fips"
    exit 1
  '';
}
