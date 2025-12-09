{ pkgs, lib, ... }:

# TODO: Add tests for metricbeat-fips image
{
  name = "metricbeat-fips";
  
  # Basic smoke test - override when implementing
  script = ''
    echo "No tests implemented yet for metricbeat-fips"
    exit 1
  '';
}
