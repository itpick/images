{ pkgs, lib, ... }:

# TODO: Add tests for prometheus-fips image
{
  name = "prometheus-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for prometheus-fips"
    exit 1
  '';
}
